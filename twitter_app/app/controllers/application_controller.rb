class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_filter :signup_params, if: :devise_controller?

  private
   def signup_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
   end
end
