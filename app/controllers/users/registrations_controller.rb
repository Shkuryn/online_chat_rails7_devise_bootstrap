class Users::RegistrationsController < Devise::RegistrationsController


  def new
    super
  end

  def create
    super
  end

  def update
    # devise_parameter_sanitizer.for(:sign_up) << :username
    super
  end

  def destroy
    super
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end
end
