class VisiterMailer < Devise::Mailer

  def welcome_email(visitor)
    @visitor = params[visitor]
    mail(to: @visitor.email, subject: "Welcome to My Protfolio Site")
  end

end
