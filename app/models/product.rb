class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates_numericality_of :price, greater_than: 0
  
  has_many :reviews
  has_many :orderitems
  belongs_to_and_has_many :categories
end
