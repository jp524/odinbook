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
    respond_to do |format|
      if @post.save
        format.turbo_stream { render turbo_stream: turbo_stream.append('posts', @post) }
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
