class ApplicationMailer < ActionMailer::Base 
  include AssetsHelper
  before_action :get_assets_css
  default from: Cfg["mail"]["sender"]
  layout 'mailer'

  def get_assets_css
    mailer_name = self.class.to_s.downcase
    source = "stylesheets/mailer/#{mailer_name}"
    @css = get_file_content(source, "css")
  end

end
