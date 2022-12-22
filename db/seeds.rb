# frozen_string_literal: false

Post.delete_all
Profile.delete_all
User.delete_all

10.times do
  name = Faker::Name.name

  user = User.create(
    email: Faker::Internet.email(name: name),
    password: Faker::Internet.password
  )

  Profile.create(
    name: name,
    location: "#{Faker::Address.city}, #{Faker::Address.country}",
    birthday: Faker::Date.birthday(min_age: 12, max_age: 90),
    user_id: user.id
  )

  3.times do
    Post.create(
      content: Faker::Lorem.paragraph,
      user_id: user.id
    )
  end
end

known_user = User.create(email: 'test@email.com', password: 'abc123')

Profile.create(
  name: 'Jane Smith',
  location: 'New York City, USA',
  birthday: '1990-12-12',
  user_id: known_user.id
)

3.times do
  Post.create(
    content: Faker::Lorem.paragraph,
    user_id: known_user.id
  )
end
