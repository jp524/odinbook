class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile

  def edit
    if params[:id].to_i != @profile.id
      redirect_to user_path(current_user), flash: { error: 'You can only edit your own profile' }
    end
  end

  def update
    if profile_params[:picture]
      path = profile_params[:picture].tempfile.path
      ImageProcessing::MiniMagick.source(path)
                                 .resize_to_fill(500, 500)
                                 .call(destination: path)
    end
    if @profile.update(profile_params)
      redirect_to user_path(current_user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:name, :location, :birthday, :picture)
  end
end
