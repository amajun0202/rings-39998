class Location < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :meal_enter
  belongs_to :requires

  validates :meal_enter_id,  presence: true, numericality: { other_than: 1, message: "を選んでください！" }
  validates :requires_id,    presence: true, numericality: { other_than: 1, message: "を選んでください！" }
  validates :images,         presence: true
  validates :title,          presence: true
  validates :estimated_time, presence: true
  validates :cost,                           numericality: { only_integer: true, message: "半角数字のみです!"}
  validates :description,    presence: true
  validates :address,        presence: true, uniqueness: true
  validates :phone_number,                   numericality: { only_integer: true, message: "半角数字のみです!"}, length: { in: 10..11, message: "正しい電話番号をお願いします!"}
  validates :nearest_station
  validates :travel_time,                    numericality: { only_integer: true, message: "半角数字のみです!"}
  validates :business_hours, presence: true
  validates :official_url,                   format: { with: URI::DEFAULT_PARSER.make_regexp, message: "は正しいURLの形式で入力してください!" }

  
end
