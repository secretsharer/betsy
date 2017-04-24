class OrderItemsController < ApplicationController

  def new
    @orderitem = Orderitem.new
  end

  def create
    @orderitem.create
  end

  def show
    @orderitem = Orderitem.find_by_id (params[:id])
  end

  def edit
    @orderitem = Orderitem.find_by_id (params[:id])
    if @orderitem == nil
      render_404
    end
  end

  def destroy
    Orderitem.destroy(params[:id])
    redirect_to #order path?
  end

  #we will need a method to get order items by order

  #we will need a method to get order items by Merchant (the person who is selling the product)

  private

  def orderitem_params
    params.require(:orderitem).permit(:quantity)

  end

end
