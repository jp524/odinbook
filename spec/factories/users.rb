FactoryBot.define do
  factory :user do
    email { 'jane_smith@test.com' }
    password { 'abc123' }

    after(:create) do |user|
      create(:post, user: user)
      create(:profile, user: user)
    end
  end
end
