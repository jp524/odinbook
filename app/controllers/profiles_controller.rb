class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile

  def edit
    return unless @profile.id != params[:id]

    redirect_to user_path(current_user), flash: { error: 'You can only edit your own profile' }
  end

  def update
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
