class FriendRequest < ApplicationRecord
  belongs_to :sent_by, class_name: 'User'
  belongs_to :sent_to, class_name: 'User'
end
