class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.excluding(current_user)
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @posts = @user.posts.sorted_by_date
  end
end
