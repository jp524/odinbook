class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @profile = Profile.find(params[:id])
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
    params.require(:profile).permit(:name, :location, :birthday)
  end
end
