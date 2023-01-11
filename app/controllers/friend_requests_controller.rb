class FriendRequestsController < ApplicationController
  def create
    @friend_request = FriendRequest.create!(friend_request_params)
    redirect_to users_path
  end

  private

  def friend_request_params
    params.permit(:sent_by_id, :sent_to_id)
  end
end
