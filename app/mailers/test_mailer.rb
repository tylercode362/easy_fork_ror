class TestMailer < ApplicationMailer
  def welcome_email(to)
    binding.pry
    mail(to: to, subject: 'Welcome to My Awesome Site')
  end
end
