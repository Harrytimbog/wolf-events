# app/controllers/users/registrations_controller.rb
module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[username role photo])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[username role photo is_admin])
    end
  end
end
