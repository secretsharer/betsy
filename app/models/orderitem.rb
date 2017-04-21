class Orderitem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0,  }

  #WIP not actually good code yet
  # validates :enough_product_in_stock

  def enough_product_in_stock
    if quantity < orderitem.product.quantity  #what is the syntax for this; how to call the quantity of the product
      errors.add("We don't have enough of that product")
    end
  end


end
