class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:fname])
       devise_parameter_sanitizer.permit(:account_update, keys: [:fname])
       devise_parameter_sanitizer.permit(:sign_in, keys: [:fname])
       devise_parameter_sanitizer.permit(:sign_up, keys: [:lname])
       devise_parameter_sanitizer.permit(:account_update, keys: [:lname])
       devise_parameter_sanitizer.permit(:sign_in, keys: [:lname])
    end

end
