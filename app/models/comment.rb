class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :content, presence: true

  scope :sorted_by_date, -> { order(created_at: :asc) }

  # Handling of timezone based on current_user to be implemented later
  def formatted_datetime
    created_at.in_time_zone('Eastern Time (US & Canada)').strftime('%b %d, %Y at %H:%M (EST)')
  end
end
