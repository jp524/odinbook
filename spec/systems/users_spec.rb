require 'rails_helper'

RSpec.describe 'Users system', type: :system do
  it 'redirects to sign-in page when user is not signed-in' do
    visit('/')
    expect(current_path).to have_content('/users/sign_in')
  end

  it 'logs in a known user and redirects to root path' do
    User.create!(email: 'test@example.com', password: 'abc123')

    visit('/')
    expect(current_path).to have_content('/users/sign_in')

    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'abc123')
    click_button('Log in')

    expect(current_path).to have_content('/')
  end
end
