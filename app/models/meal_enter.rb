class MealEnter < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '食事系' },
    { id: 3, name: '娯楽系' }
  ]

  include ActiveHash::Associations
  has_many :locations
  end