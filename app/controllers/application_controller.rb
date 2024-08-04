# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permit parameters for sign up
    devise_parameter_sanitizer.permit(:sign_up, keys: sign_up_params)

    # Permit parameters for account update
    devise_parameter_sanitizer.permit(:account_update, keys: account_update_params)
  end

  private

  def sign_up_params
    %i[email password password_confirmation addresses_attributes]
  end

  def account_update_params
    %i[email password password_confirmation current_password addresses_attributes]
  end

  def authenticate_active_admin_user
    return if current_user.admin?

    flash[:alert] = 'You are not authorized to access this page.'
    redirect_to(root_path)
  end
end
