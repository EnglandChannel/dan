class UserMailer < ApplicationMailer
  default from: 'davithau987654321.dh@gmail.com'
 
  def welcome_email user
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def order_received(order)
    @order = order 
    mail(to: @order.email, subject: "We've received your order")
  end

end
