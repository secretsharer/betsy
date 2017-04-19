require "test_helper"

describe Orderitem do
  it "makes an order item with a good number" do
    order = orderitems(:one)
    order.valid?.must_equal true
    order.errors.messages.wont_include :quantity
  end

  it "quantity must be greater than zero" do
    neg_qty = orderitems(:neg_qty)
    neg_qty.valid?.must_equal false
    neg_qty.errors.messages.must_include :quantity

    zero_qty = orderitems(:zero_qty)
    zero_qty.valid?.must_equal false
    zero_qty.errors.messages.must_include :quantity
  end

  it 'quantity must be an integer' do
    float_qty = orderitems(:float_qty)
    float_qty.valid?.must_equal false
    float_qty.errors.messages.must_include :quantity
  end

  it 'must be present' do
    no_qty = Orderitem.new
    no_qty.valid?.must_equal false
  end

  it 'must belong to an order' do
    skip
  end

  it 'must belong to a Product' do
    skip
  end

end
