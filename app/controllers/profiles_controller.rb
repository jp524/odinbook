class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @profile = Profile.find(params[:id])
    return unless current_user != @profile.user

    redirect_to user_path(current_user), flash: { error: 'You can only edit your own profile' }
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to user_path(current_user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :location, :birthday, :picture)
  end
end
