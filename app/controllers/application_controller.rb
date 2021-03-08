class ApplicationController < ActionController::API
    before_action :configure_devise_parameters, if: :devise_controller?

    def render_jsonapi_response(resource)
        if resource.errors.empty?
          render jsonapi: resource
        else
          render jsonapi_errors: resource.errors, status: 400
        end
    end

    def configure_devise_parameters
        devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:name, :role, :is_alive, :email, :password, :password_confirmation)}
        devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:name, :role, :is_alive, :email, :password, :password_confirmation, :current_password)}
    end
end
