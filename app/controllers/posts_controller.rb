class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.includes(:likes, :comments, user: [:profile]).user_and_friends_posts(current_user).sorted_by_date
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.turbo_stream { render turbo_stream: turbo_stream.prepend('posts', @post) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
