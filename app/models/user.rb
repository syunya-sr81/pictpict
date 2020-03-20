class User < ApplicationRecord
    validates :name, presence: true,
                     length: {maximum: 15}
    validates :email, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
   has_secure_password
    validates :password, length: {minimum: 8, maximum: 32}
    VALID_PASWAD_REGEX = /\A[a-zA-Z0-9]+\z/
    validates :password, presence: true, format: {with: VALID_PASWAD_REGEX}
    
     has_many :topics, dependent: :destroy
     has_many :favorites, dependent: :destroy
     has_many :favorite_topics, through: :favorites, source: 'topic'
     has_many :comments
end