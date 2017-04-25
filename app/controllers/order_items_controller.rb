class OrderItemsController < ApplicationController


  def create

    if Orderitem.find_by_product_id(params[:order_items][:product_id]) != nil
      flash[:error] = "This item is already in your cart"

    elsif Product.in_stock(params[:order_items][:product_id], params[:order_items][:quantity])
      @orderitem = Orderitem.new
      @orderitem.product_id = params[:order_items][:product_id]
      @orderitem.quantity = params[:order_items][:quantity]
      @orderitem.order_id = current_order.id
      @orderitem.save
      flash[:success] = "Item added to cart"
    else
      flash[:error] = "Not enough product in stock"
    end
      redirect_to product_path(params[:order_items][:product_id])
  end

  def update
    #change qty of item
    @orderitem = Orderitem.find_by_id(params[:id])

    if @orderitem.update orderitem_params
      redirect_to carts_show_path
    else
      flash[:error] = "Could not update cart"
    end
  end

  def destroy
    Orderitem.destroy(params[:id])
    redirect_to carts_show_path
  end

  #we will need a method to get order items by order

  #we will need a method to get order items by Merchant (the person who is selling the product)

  private

  def orderitem_params
    params.require(:orderitem).permit(:quantity, :product_id)

  end

end
