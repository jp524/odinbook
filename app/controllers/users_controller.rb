class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @potential_friends = current_user.can_send_requests_to
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @posts = @user.posts
  end
end
