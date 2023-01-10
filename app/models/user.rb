class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :sent_friend_requests, foreign_key: :sent_by, class_name: 'FriendRequest', dependent: :destroy
  has_many :received_friend_requests, foreign_key: :sent_to, class_name: 'FriendRequest', dependent: :destroy

  accepts_nested_attributes_for :profile

  def all_friend_requests
    sent_friend_requests + received_friend_requests
  end

  def friends
    find_friends('accepted')
  end

  def requested_friends
    find_friends('requested')
  end

  def declined_friends
    find_friends('declined')
  end

  def find_friends(request_status)
    list = []
    all_friend_requests.select! { |friend_request| friend_request.status == request_status }
    list << all_friend_requests.map do |friend_request|
      if friend_request.sent_by == self
        friend_request.sent_to
      elsif friend_request.sent_to == self
        friend_request.sent_by
      end
    end
  end
end
