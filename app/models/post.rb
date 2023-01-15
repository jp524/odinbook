class Post < ApplicationRecord
  belongs_to :user

  validates :content, presence: true

  scope :sorted_by_date, -> { order(created_at: :desc) }

  def self.user_and_friends_posts(current_user)
    friends = current_user.friends
    Post.where(user: current_user).or(Post.where(user: friends))
  end
end
