class Order < ApplicationRecord
  has_many :orderitems #,:dependent => :destroy
  # belongs_to :order_status
  # before_create :set_order_status
  # before_save :update_subtotal
  #
  # validates :id, presence: true, uniqueness: true
  # validates :session, presence: true

  def subtotal
    orderitems.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def add_product(product_id, quantity)
    quantity ||= 1
    oi = orderitems.find_or_create_by_product_id(product_id)
    Orderitem.update_counters oi.id, :quantity => quantity
  end

private

  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
