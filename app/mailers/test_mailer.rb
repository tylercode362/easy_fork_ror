class TestMailer < ApplicationMailer
  def welcome_email(to)
    mail(to: to, subject: 'Welcome to My Awesome Site', template_path: "test_mailer", template_name: "test_mailer").deliver
  end
end
