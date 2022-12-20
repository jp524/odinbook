class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts
    # Will be revised to add posts from current_user's friends as well
  end
end