class TestMailer < ApplicationMailer
  def welcome_email(to)
    #Todo load webpacker css data
    @css = "div{color:red}"
    mail(to: to, subject: 'Welcome to My Awesome Site', template_path: "test_mailer", template_name: "test_mailer")
  end
end
