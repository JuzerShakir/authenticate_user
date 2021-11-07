class SessionsController < Devise::SessionsController
  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

  private

  def check_captcha
    if verify_recaptcha
      true
    else
      self.resource = resource_class.new(sign_in_params)
      respond_with_navigational(resource) { render :new }
      return # this runs flash message
    end
  end
end

