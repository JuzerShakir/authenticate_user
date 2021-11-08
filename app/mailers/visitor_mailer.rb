class VisitorMailer < ApplicationMailer

  def welcome_email
    @visitor = params[:visitor]
    mail(to: @visitor.email, subject: "Welcome to My Protfolio Site")
  end

end
