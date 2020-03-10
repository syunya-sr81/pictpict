class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  
  belongs_to :user
  
  has_secure_password

  has_many :topics
  
  mount_uploader :image, ImageUploader
end
