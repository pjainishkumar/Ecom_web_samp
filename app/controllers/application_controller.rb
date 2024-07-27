class ApplicationController < ActionController::Base
   # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, addresses_attributes: [:id, :street, :city, :postal_code, :province_id, :_destroy]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :current_password, addresses_attributes: [:id, :street, :city, :postal_code, :province_id, :_destroy]])
  end

  private

  def authenticate_active_admin_user
    unless current_user.admin?
      flash[:alert] = "You are not authorized to access this page."
      redirect_to(root_path)
    end
  end
end
