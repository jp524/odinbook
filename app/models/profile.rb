class Profile < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :location, presence: true
  validates :birthday, presence: true
  validate :user_has_to_be_at_least_thirteen

  def user_has_to_be_at_least_thirteen
    errors.add(:birthday, 'is not acceptable. User must be at least 13 years old') if birthday > Date.today - 13.years
  end

  def formatted_birthday
    birthday.strftime('%B %d')
  end
end
