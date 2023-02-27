# frozen_string_literal: false

puts "\n== Seeding database =="

Comment.delete_all
Like.delete_all
Post.delete_all
FriendRequest.delete_all
Profile.delete_all
User.delete_all

10.times do
  name = Faker::Movies::HarryPotter.character

  user = User.create(
    email: Faker::Internet.email(name: name),
    password: 'password'
  )

  Profile.create(
    name: name,
    location: Faker::Movies::HarryPotter.location,
    birthday: Faker::Date.birthday(min_age: 12, max_age: 90),
    user_id: user.id
  )

  3.times do
    Post.create(
      content: Faker::Movies::HarryPotter.quote,
      user_id: user.id
    )
  end
end
