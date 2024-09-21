class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Remove :is_admin from permitted parameters during signup
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username role photo])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username role photo is_admin])
  end
end
