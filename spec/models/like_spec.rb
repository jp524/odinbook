require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'A user liking a post' do
    it 'creates a relationship that can be found with "user.liked_posts' do
      user = FactoryBot.create(:user)
      user_two = FactoryBot.create(:user_two)
      post = user.posts.first
      Like.create(post: post, user: user_two)
      expect(user_two.liked_posts).to include(post)
    end

    it 'creates a relationship that can be found with "post.liked_by"' do
      user = FactoryBot.create(:user)
      user_two = FactoryBot.create(:user_two)
      user_three = FactoryBot.create(:user_three)
      post = user.posts.first
      Like.create(post: post, user: user_two)
      Like.create(post: post, user: user_three)
      expect(post.liked_by).to eq([user_two, user_three])
    end

    describe 'A user that wrote a post' do
      it 'cannot like their own post' do
        user = FactoryBot.create(:user)
        post = user.posts.first
        like = Like.create(post: post, user: user)
        expect(like).to_not be_valid
      end
    end
  end
end
