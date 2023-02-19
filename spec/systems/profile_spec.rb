require 'rails_helper'

RSpec.describe 'Profiles system', type: :system do
  before do
    @user = users(:jane)
    login_as @user
  end

  it "edits a user's profile" do
    visit user_path(@user)
    assert_selector 'h2', text: @user.profile.name
    assert_selector 'p', text: @user.profile.location

    click_on 'Edit my profile'

    fill_in('Location', with: 'Berlin, Germany')
    click_on 'Save'

    assert_selector 'h2', text: @user.profile.name
    assert_selector 'p', text: 'Berlin, Germany'
  end
end
