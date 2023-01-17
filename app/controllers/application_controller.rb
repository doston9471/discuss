class ApplicationController < ActionController::Base
  # before_action :set_current_user, if: :user_signed_in?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
  

  private

  # def set_current_user
  #   Current.user = current_user
  # end

  # helper_method :current_user

  # def current_user
  #   return @current_user if @current_user.present?

  #   if session[:user_id].present?
  #     @current_user = User.find_by(id: session[:user_id])
  #   else
  #     @current_user = User.generate
  #     session[:user_id] = @current_user.id
  #     @current_user
  #   end

  #   if @current_user.nil?
  #     @current_user = User.generate
  #     session[:user_id] = @current_user.id
  #     @current_user
  #   end

  #   # cookies[:user_id] = @current_user.id
  #   @current_user
  # end
end
