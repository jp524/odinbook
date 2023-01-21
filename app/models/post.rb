class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liked_by, through: :likes, source: :user

  validates :content, presence: true

  scope :sorted_by_date, -> { order(created_at: :desc) }

  def self.user_and_friends_posts(current_user)
    friends = current_user.friends
    Post.where(user: current_user).or(Post.where(user: friends))
  end

  # Handling of timezone based on current_user to be implemented later
  def formatted_datetime
    created_at.in_time_zone('Eastern Time (US & Canada)').strftime('%b %d, %Y at %H:%M (EST)')
  end
end
