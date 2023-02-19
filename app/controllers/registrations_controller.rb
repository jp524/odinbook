class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def create
    set_flash_message! :notice, :signed_up, :now
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: permitted_attributes)
  end

  def permitted_attributes
    [
      :email,
      :password,
      :password_confirmation,
      profile_attributes: %i[name location birthday picture]
    ]
  end
end
