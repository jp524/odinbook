class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @users.reject { |user| user == current_user }
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @posts = @user.posts
  end
end
