module AssetsHelper

  def webpack_include_javascript(source)
    get_assets_path(source, "js")
  end

  def webpack_link_css(source)
    get_assets_path(source, "css")
  end

  def webpack_show_img(source, options = {})
    get_assets_path(source, "img", options)
  end

  def get_manifest
    manifest_file = if Rails.env.development?
                      "#{Cfg["assets_host"]}/webpack/manifest.json"
                    else
                      Rails.root.join('public','webpack','manifest.json')
                    end
    JSON.load(open(manifest_file).read)
  end

  def get_assets_path(file_name, ext = nil, options = {})
    asset_server = Cfg["assets_host"]
    file_name = file_name.gsub("/", "_")
    @manifest ||= get_manifest
    path = if @manifest[file_name.to_s + "." + ext].present?
              asset_server + @manifest[file_name.to_s + "." + ext].gsub(".*/", "")
            else
              asset_server + @manifest[file_name.to_s].gsub(".*/", "")
            end
    case ext
    when "js"
      javascript_include_tag(path)
    when "css"
      stylesheet_link_tag(path)
    when "img"
      image_tag(path, options)
    end
  end

end