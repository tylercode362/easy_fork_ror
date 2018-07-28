module AssetsHelper
  def include_javascript(source)
    get_assets_cache_path(source, "js")
  end
  
  def include_css(source)
    get_assets_cache_path(source, "css")
  end
  
  def show_img(source, options = {})
    get_assets_cache_path(source, "img", options)
  end

  def get_assets_cache_path(source, ext = nil, options = {})
    @manifest ||= JSON.parse File.read(File.join(Rails.root, "public/assets/manifest.json"))
    path = if @manifest[source.to_s + "." + ext].present?
              Cfg["assets_host"] + @manifest[source.to_s + "." + ext].gsub(".*/", "")
            else
              Cfg["assets_host"] + @manifest[source.to_s].gsub(".*/", "")
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