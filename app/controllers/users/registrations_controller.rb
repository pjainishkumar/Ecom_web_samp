# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :initialize_addresses, only: %i[edit update]

    protected

    def initialize_addresses
      resource.addresses.build if resource.addresses.blank?
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: sign_up_params)
      devise_parameter_sanitizer.permit(:account_update, keys: account_update_params)
    end

    private

    def sign_up_params
      %i[email password password_confirmation addresses_attributes]
    end

    def account_update_params
      %i[email password password_confirmation current_password addresses_attributes]
    end
  end
end
