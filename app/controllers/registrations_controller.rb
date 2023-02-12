class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def new
    build_resource({})
    resource.build_profile
    respond_with resource
  end

  def create
    path = sign_up_params[:profile_attributes][:picture].tempfile.path
    ImageProcessing::MiniMagick.source(path)
                               .resize_to_fill(500, 500)
                               .call(destination: path)
    super
  end

  protected

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up) { |user| user.permit(permitted_attributes) }
  end

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
