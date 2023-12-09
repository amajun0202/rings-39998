class Comment < ApplicationRecord
  belongs_to :location
  belongs_to :user
  
  validates :text,         presence: true
  
end
