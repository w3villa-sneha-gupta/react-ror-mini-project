class UserMailer < ApplicationMailer
  
  default from: 'no-reply@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
