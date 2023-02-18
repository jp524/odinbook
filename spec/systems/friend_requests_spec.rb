require 'rails_helper'

RSpec.describe 'Friend Requests system', type: :system do
  include ActionView::RecordIdentifier

  before do
    FriendRequest.delete_all
  end

  it 'sends a friend request that can be accepted' do
    login_as users(:robert)

    visit users_path
    assert_selector 'h1', text: 'Find New Friends'

    within "##{dom_id(users(:jane))}" do
      click_on 'Send Friend Request'
    end

    assert_selector 'h1', text: 'Find New Friends'

    within "##{dom_id(users(:jane))}" do
      assert_selector 'p', text: 'Request Sent'
    end

    logout(users(:robert))
    login_as users(:jane)
    visit users_path

    click_on 'Notifications'

    within "li##{dom_id(users(:robert))}" do
      click_on 'Accept'
    end

    within "##{dom_id(users(:robert))}" do
      assert_selector 'p', text: 'Friends'
    end
  end

  it 'sends a friend request that can be declined' do
    login_as users(:robert)

    visit users_path
    assert_selector 'h1', text: 'Find New Friends'

    within "##{dom_id(users(:jane))}" do
      click_on 'Send Friend Request'
    end

    assert_selector 'h1', text: 'Find New Friends'

    within "##{dom_id(users(:jane))}" do
      assert_selector 'p', text: 'Request Sent'
    end

    logout(users(:robert))
    login_as users(:jane)
    visit users_path

    click_on 'Notifications'

    within "li##{dom_id(users(:robert))}" do
      click_on 'Decline'
    end

    within "##{dom_id(users(:robert))}" do
      assert_selector 'p', text: 'Request Sent'
    end
  end
end