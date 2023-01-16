class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validate :not_self

  def not_self
    errors.add(:user, "can't like their own post") if user == post.user
  end
end
