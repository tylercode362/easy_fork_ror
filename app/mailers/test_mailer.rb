class TestMailer < ApplicationMailer
  def welcome_email(to)
    mail(to: to, subject: 'Welcome to My Awesome Site')
  end
end
