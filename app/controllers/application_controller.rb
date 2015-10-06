class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    before_filter :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            if resource_name == :user
            	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password) }
           	elsif resource_name == :seller
            	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :shop_name, :avatar) }
            elsif resource_name == :admin
            	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :avatar, :name, :last_name, :passport_image, :dob) }
           	end 
        end
end
