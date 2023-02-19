require 'rails_helper'

RSpec.describe 'Likes system', type: :system do
  include ActionView::RecordIdentifier

  before do
    Like.delete_all
    @user = users(:jane)
    @user_two = users(:robert)
    @post = posts(:post)
    FriendRequest.create(sent_by: @user, sent_to: @user_two, status: 'accepted')
  end

  it 'likes a post written by a friend' do
    login_as @user_two

    visit posts_path
    assert_selector 'h1', text: 'Posts'

    within "##{dom_id(@post)}" do
      click_on 'Like'
    end

    within "##{dom_id(@post)}" do
      assert_selector 'div', text: '1 Like'
    end
  end
end
