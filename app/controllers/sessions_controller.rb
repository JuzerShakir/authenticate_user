class SessionsController < Devise::SessionsController
  before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

  private

  def check_captcha
    self.resource = resource_class.new sign_in_params

    if verify_recaptcha.nil?
      flash.discard(:recaptcha_error)# We need to discard flash to avoid showing it on the next page reload
      render :new
    else
    end
  end
end
