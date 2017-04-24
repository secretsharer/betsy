class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates_numericality_of :price, greater_than: 0

<<<<<<< HEAD
  belongs_to :merchant, :foreign_key => 'merchant_id'

=======

  belongs_to :merchant, :foreign_key => 'merchant_id'


>>>>>>> js/merchant_model
  has_many :reviews
  has_many :orderitems
  has_and_belongs_to_many :categories
end
