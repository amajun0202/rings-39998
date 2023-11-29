class Requires < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '必要です' },
    { id: 3, name: '必要ではありません' }
  ]

  include ActiveHash::Associations
  has_many :locations
  end