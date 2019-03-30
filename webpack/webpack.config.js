const path = require('path');
const _ = require('lodash');
const webpack = require('webpack');
const assetPath = path.join(__dirname, '../', 'public', 'webpack');
const ExtractTextPlugin = require("extract-text-webpack-plugin");
const ManifestPlugin = require('webpack-manifest-plugin');
const jsPath = path.resolve(__dirname, './javascripts');
const cssPath = path.resolve(__dirname, './stylesheets');
const imagePath = path.resolve(__dirname, './images');

const config = module.exports = {
  context: jsPath,
  //source file
  entry: {
    app: './app.js'
  },
  devtool: 'cheap-module-eval-source-map'
};

config.output = {
  path: assetPath,
  filename: '[name]_[chunkhash].js',
  publicPath: '/webpack/'
};

config.resolve = {
  modules: [__dirname, '../', 'node_modules'],
  extensions: ['.js','.jsx', '.coffee', '.json'],
  alias: {
    'images': imagePath,
    'stylesheets': cssPath
  }
};

config.plugins = [
  // auto load jquery for every page
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery'
  }),

  new ExtractTextPlugin('[name]_[chunkhash].css', {
    allChunks: true
  }),
  new ManifestPlugin({
    fileName: 'manifest.json',
    includeCopiedAssets: true,
    imageExtensions: /^(css|jpe?g|png|gif|svg|woff|woff2|otf|ttf|eot|svg|js|ico|gif|mp4)(\.|$)/i,
    seed: {}
  }),

  new webpack.DefinePlugin({
    _IMAGE_PATH_: JSON.stringify(imagePath),
    _JS_PATH_:  JSON.stringify(jsPath),
    _CSS_PATH_:  JSON.stringify(cssPath)
  }),
];

config.module = {
  rules: [
    //expose jquery for other js
    {test: require.resolve("jquery"), loader: "expose?jQuery" },
    {test: require.resolve("jquery"), loader: "expose?$" },

    {test: /\.js$/, loader: 'babel-loader'},

    {test: /\.coffee$/, loader: 'coffee-loader'},

    // url-loader encode font and image file
    {test: /\.(woff|woff2|eot|ttf|otf)\??.*$/, loader: 'url-loader?limit=8192&name=[name].[ext]'},
    {test: /\.(jpe?g|png|gif|svg)\??.*$/, loader: 'file-loader', options: { name: '[name].[ext]?[hash]' } },
    {test: /\.css$/, loader: ExtractTextPlugin.extract('css-loader')},
    {test: /\.scss$/, use:
      [{
        loader: 'style-loader', // inject CSS to page
      }, {
        loader: 'css-loader', // translates CSS into CommonJS modules
      }, {
        loader: 'postcss-loader', // Run post css actions
        options: {
          plugins: function () { // post css plugins, can be exported to postcss.config.js
            return [
              require('precss'),
              require('autoprefixer')
            ];
          }
        }
      }, {
        loader: 'sass-loader' // compiles Sass to CSS
      }]
    }
  ]
};