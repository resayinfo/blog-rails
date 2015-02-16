class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me, :first_name, :last_name) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :first_name, :last_name, :biography) }
  end

  private

  def authenticate_user_from_token!
     # Attempt to sign in user with header token
     authenticate_with_http_token do |token, options|
       user = User.find_by_authentication_token(token)
       if user
         sign_in user, store: false
       else
         # Fall back to sign in user with URL token
         auth_token = params[:auth_token].presence
         if auth_token
           user = User.find_by_authentication_token(auth_token.to_s)
           if user
             sign_in user, store: false
           end
         end
       end
     end
   end

end
