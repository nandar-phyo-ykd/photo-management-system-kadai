class Photo < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { :maximum => 30 }
  validates :attachment, presence: true, allow_blank: false
end
