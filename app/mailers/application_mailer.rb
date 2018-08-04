class ApplicationMailer < ActionMailer::Base 
  include AssetsHelper
  
  default from: Cfg["mail"]["sender"]
  layout 'mailer'

end
