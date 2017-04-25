class OrderItemsController < ApplicationController


  def create

    if Product.in_stock(params[:order_items][:product_id], params[:order_items][:quantity])
      @orderitem = Orderitem.new
      @orderitem.product_id = params[:order_items][:product_id]
      @orderitem.quantity = params[:order_items][:quantity]
      @orderitem.order_id = current_order.id
      @orderitem.save
    else
      flash[:error] = "Not enough product in stock"
    end
      flash[:success] = "Item added to cart"
      redirect_to product_path(@orderitem.product.id)
  end

  def update
    #change qty of item
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
