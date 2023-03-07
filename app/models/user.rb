class User < ApplicationRecord
  has_secure_password
  has_many :photos, class_name: 'User', foreign_key: 'user_id'

  validates :user_id, presence: true, allow_blank: false
  validates :password, presence: true, allow_blank: false
end
