require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @liker = users(:robert)
    @post = posts(:post)
    @like = Like.create(post: @post, user: @liker)
  end
  describe 'A user liking a post' do
    it 'creates a relationship that can be found with "user.liked_posts"' do
      expect(@liker.liked_posts).to include(@post)
    end

    it 'creates a relationship that can be found with "post.liked_by"' do
      expect(@post.liked_by).to include(@liker)
    end
  end

  describe 'A user' do
    it 'cannot like their own post' do
      post_author = users(:jane)
      like_by_author = Like.create(post: @post, user: post_author)
      expect(like_by_author).to_not be_valid
    end

    it 'cannot like the same post twice' do
      second_like = Like.create(post: @post, user: @liker)
      expect(second_like).to_not be_valid
    end

    it 'can like two different posts' do
      second_post = posts(:second_post)
      second_like = Like.create(post: second_post, user: @liker)
      expect(second_like).to be_valid
    end
  end
end
