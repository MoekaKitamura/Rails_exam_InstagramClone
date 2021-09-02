class Comment < ApplicationRecord
  belongs_to :picture

  validates :content, presence: true
end
