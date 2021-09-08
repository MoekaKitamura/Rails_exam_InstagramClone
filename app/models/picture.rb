class Picture < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy

  # validates :image,  presence: true
  validates :content, presence: true, length: { maximum: 255 }

  mount_uploader :image, ImageUploader
end
