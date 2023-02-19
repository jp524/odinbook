require 'rails_helper'

RSpec.describe Post, type: :system do
  include ActionView::RecordIdentifier

  before do
    @user = users(:jane)
    @post = @user.posts.first
  end

  it 'creates a new post' do
    user = users(:robert)
    login_as user

    visit posts_path
    assert_selector 'h1', text: 'Posts'

    click_on 'New post'
    fill_in 'Content', with: 'Capybara post'
    click_on 'Post'

    assert_selector 'h1', text: 'Posts'
    assert_text 'Capybara post'
  end

  it 'shows all posts from a user' do
    login_as @user
    visit posts_path
    assert_selector 'h1', text: 'Posts'
    assert_text @user.posts.first.content
    assert_text @user.posts.last.content
  end

  it 'destroys a post' do
    login_as @user
    visit posts_path

    within "##{dom_id(@post)}" do
      assert_text @post.content
    end

    within "##{dom_id(@post)}" do
      click_on 'Delete'
    end

    assert_no_text @post.content
  end
end
