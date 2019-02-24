class UserMailer < ApplicationMailer
  default from: "bine09@gmx.de"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'bine09@gmx.de',
         subject: "A new contact form message from #{name}")
  end
end
