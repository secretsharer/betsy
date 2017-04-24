class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates_numericality_of :price, greater_than: 0
  validates :quantity, presence: true
  validates_numericality_of :quantity, greater_than: 0


  belongs_to :merchant, :foreign_key => 'merchant_id'

  has_many :reviews
  has_many :orderitems
  has_and_belongs_to_many :categories
end
