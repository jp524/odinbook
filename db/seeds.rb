Post.delete_all
User.delete_all

10.times do
  user = User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )

  3.times do
    post = Post.create(
      content: Faker::Lorem.paragraph,
      user_id: user.id
    )
  end
end

User.create(email: 'test@email.com', password: 'abc123')
