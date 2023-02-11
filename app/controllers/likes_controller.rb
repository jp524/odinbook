class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(like_params)
    @like.save
    redirect_to request.referrer
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    redirect_to request.referrer
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
