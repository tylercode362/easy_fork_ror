const path = require('path');
const _ = require('lodash');
const webpack = require('webpack');
const assetPath = path.join(__dirname, '../', 'public', 'assets');
const ExtractTextPlugin = require("extract-text-webpack-plugin");
const ManifestPlugin = require('webpack-manifest-plugin');
const config = module.exports = {
  context: path.resolve(__dirname, './javascripts'),
  //source file
  entry: {
    app: './app.js'
  },
  devtool: 'cheap-module-eval-source-map'
};

config.output = {
  path: assetPath,
  filename: '[name]_[chunkhash].js',
  publicPath: '/assets/'
};

config.resolve = {
  modules: [__dirname, './node_modules'],
  extensions: ['.js','.jsx', '.coffee', '.json'],
};

config.plugins = [
  // auto load jquery for every page
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery'
  }),

  new ExtractTextPlugin('[name]_bundle.css', {
    allChunks: true
  })
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
    {test: /\.(jpe?g|png|gif|svg)\??.*$/, loader: 'url-loader?limit=8192&name=[name].[ext]'},

    {test: /\.css$/, loader: ExtractTextPlugin.extract('style-loader', 'css-loader')},
    {test: /\.scss$/, loader: ExtractTextPlugin.extract('style', 'css!sass')}
  ]
};