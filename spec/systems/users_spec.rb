require 'rails_helper'

RSpec.describe 'Users system', type: :system do
  describe 'when not signed in' do
    it 'redirects to sign-in page' do
      visit('/')
      expect(current_path).to have_content('/users/sign_in')
    end

    it 'allows to create a new user' do
      visit('/')
      click_link('Sign up')

      fill_in('Email', with: 'new_user_test@example.com')
      fill_in('Password', with: 'abc123')
      fill_in('Password confirmation', with: 'abc123')
      fill_in('Name', with: 'User Test')
      fill_in('Location', with: 'London, UK')
      fill_in('Birthday', with: Time.new(1990, 01, 01))
      click_button('Sign up')

      expect(User.last.email).to eq('new_user_test@example.com')
      expect(current_path).to have_content('/')
      assert_selector 'h1', text: 'Posts'
    end
  end
end
