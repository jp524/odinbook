class Post < ApplicationRecord
  belongs_to :user

  validates :content, presence: true

  scope :sorted_by_date, -> { order(created_at: :desc) }
end
