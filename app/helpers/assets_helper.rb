module AssetsHelper
  require 'open-uri'

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

  def get_file_content(source, ext)
    #production 會實際產生 file , local 端用 webpack-dev-server 所以不會
    @manifest ||= JSON.parse File.read(File.join(Rails.root, "public/assets/manifest.json"))
    if @manifest[source.to_s + "." + ext].present?
      if Rails.env.development?
        path = if @manifest[source.to_s + "." + ext].present?
          Cfg["remote_assets_host"] + @manifest[source.to_s + "." + ext].gsub(".*/", "")
        else
          Cfg["remote_assets_host"] + @manifest[source.to_s].gsub(".*/", "")
        end
        url = URI.parse(path)
        return Net::HTTP.get(url.host, url.request_uri, url.port  )
      else
        path = File.join(Rails.root, "public", @manifest[source.to_s + "." + ext])
        if data = open(path).read
          return data
        end
      end
    end
    return ""
  end
end