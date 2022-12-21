class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts
    # Will be revised to add posts from current_user's friends as well
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
