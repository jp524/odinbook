class FriendRequestsController < ApplicationController
  before_action :set_friend_request, only: [:update, :destroy]
  def create
    @friend_request = FriendRequest.create!(friend_request_params)
    redirect_to users_path
  end

  def update
    @friend_request.update(friend_request_params)
    redirect_to request.referrer
  end

  def destroy
    @friend_request.destroy
    redirect_to request.referrer
  end

  private

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end

  def friend_request_params
    params.require(:friend_request).permit(:sent_by_id, :sent_to_id, :status)
  end
end
