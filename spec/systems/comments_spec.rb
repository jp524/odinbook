require 'rails_helper'

RSpec.describe 'Comments system', type: :system do
  include ActionView::RecordIdentifier

  before do
    @user = users(:jane)
    login_as @user
    @comment = comments(:first)
  end

  it 'creates a new comment' do
    visit posts_path
    assert_text @user.posts.first.content

    click_on 'Add a comment', match: :first
    assert_text @user.posts.first.content

    fill_in 'Content', with: 'Capybara comment'
    click_on 'Comment'

    assert_selector 'h1', text: 'Posts'
    assert_text 'Capybara comment'
  end

  it 'destroys a comment' do
    login_as @user
    visit posts_path

    within "##{dom_id(@comment)}" do
      assert_text @comment.content
    end

    within "##{dom_id(@comment)}" do
      click_on 'Delete'
    end

    assert_no_text @comment.content
  end
end
