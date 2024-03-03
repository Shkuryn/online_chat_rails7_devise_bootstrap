# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    private

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :username
    end
  end
end
