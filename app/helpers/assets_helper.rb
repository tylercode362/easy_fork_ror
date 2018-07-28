module AssetsHelper
  def include_javascript(source)
    return get_assets_cache_path(source)
    if Rails.env.production?
      get_assets_cache_path(source)
    else
      javascript_pack_tag(source)
    end
  end
  def include_css(source)
    return get_assets_cache_path(source)
    if Rails.env.production?
      get_assets_cache_path(source)
    else
      stylesheet_pack_tag(source)
    end
  end

  def get_assets_cache_path(source, ext = nil)
    @manifest ||= JSON.parse File.read(File.join(Rails.root, "public/assets/manifest.json"))
    puts Cfg["assets_host"]
    Cfg["assets_host"]
  end

end