require 'rails_helper'

RSpec.describe 'New post', type: :system do
  include Devise::Test::IntegrationHelpers
  it 'successfully creates a new post' do
    user = User.create!(email: 'test@example.com', password: 'abc123')
    sign_in user
    visit new_post_path
    expect(page).to have_button('Post')
    
    fill_in 'Content', with: 'This is the system test for a new post.'
    click_button('Post')

    expect(page).to have_content('This is the system test for a new post.')
  end
end
