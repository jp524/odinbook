require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @commenter = users(:robert)
    @post = posts(:post)
  end

  describe 'A user commenting on a post' do
    it 'creates a relationship that can be found with "post.comments"' do
      comment = Comment.create(post: @post, user: @commenter, content: 'This is great!')
      expect(@post.comments.last).to eq(comment)
    end

    it 'creates a relationship that can be found with "user.comments' do
      comment = Comment.create(post: @post, user: @commenter, content: 'This is great!')
      expect(@commenter.comments.last).to eq(comment)
    end
  end
end
