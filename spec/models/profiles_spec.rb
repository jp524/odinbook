require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @user = users(:jane)
    login_as @user
  end

  it 'a user has a valid profile' do
    expect(@user.profile.name).to eq('Jane Doe')
  end
end
