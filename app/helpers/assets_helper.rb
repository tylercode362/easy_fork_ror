module AssetsHelper
  def include_javascript(source)
    get_assets_cache_path(source, "js")
  end
  def include_css(source)
    get_assets_cache_path(source, "css")
  end

  def get_assets_cache_path(source, ext = nil)
    @manifest ||= JSON.parse File.read(File.join(Rails.root, "public/assets/manifest.json"))
    path = Cfg["assets_host"] + @manifest[source.to_s + "." + ext].gsub(".*/", "")
    case ext
    when "js"
      javascript_include_tag(path)
    when "css"
      stylesheet_link_tag(path)
    end
  end

end