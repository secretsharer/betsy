class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates_numericality_of :price, greater_than: 0

<<<<<<< HEAD
  belongs_to :merchant, :foreign_key => 'merchant_id'
=======
>>>>>>> 2d3ca3d8a76911fb2c852f713c354f147e42cf7d
  has_many :reviews
  has_many :orderitems
  has_and_belongs_to_many :categories
end
