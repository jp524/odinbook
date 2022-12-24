class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_one :profile, dependent: :destroy
  after_create :init_profile

  def init_profile
    create_profile(name: 'TBD', location: 'TBD', birthday: '1990-01-01')
  end
end
