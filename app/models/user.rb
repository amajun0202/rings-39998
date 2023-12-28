class User < ApplicationRecord
  has_many :locations
  has_many :comments
  has_many :likes
  has_many :liked_locations, through: :likes, source: :location
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英字と数字の両方を含む必要があります' 

         validates :nickname,           presence: true
         validates :introduce,          presence: true
end
