class User < ApplicationRecord
    has_many :pictures, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :favorite_pictures, through: :favorites, source: :picture
    has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
    has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships, source: :follower

    validates :name,  presence: true, length: { maximum: 30 }
    validates :email, presence: true, length: { maximum: 255 },format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    before_validation { email.downcase! }
    
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    
    mount_uploader :image_name, IconUploader
end
