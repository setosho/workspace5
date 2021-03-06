class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :content, presence: true
  validates :image, presence: true
  belongs_to :user
  delegate :email, to: :user, prefix: :author, allow_nil: false
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
