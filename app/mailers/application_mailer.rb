class ApplicationMailer < ActionMailer::Base 
  default from: Cfg["mail"]["sender"]
  layout 'mailer'
end
