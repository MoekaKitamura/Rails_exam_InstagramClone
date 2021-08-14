class Picture < ApplicationRecord
  belongs_to :user
  validates :image,  presence: true
  validates :content, presence: true, length: { maximum: 255 }
  mount_uploader :image, ImageUploader
end
