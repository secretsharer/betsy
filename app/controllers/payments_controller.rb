class PaymentsController < ApplicationController
  def new; end

  def payment_confirmation
    @order = current_order
    @orderitems = current_order.orderitems
  end

  def update
    order = Order.find_by_id(session[:order_id])

    order.status = "PAID"
    order.email = params[:order][:email]
    order.address = params[:order][:address]
    order.cc_num = params[:order][:cc_num]
    order.cc_expiry = params[:order][:cc_expiry]
    order.cc_security = params[:order][:cc_security]
    order.zip = params[:order][:zip]

    if order.save
      redirect_to payment_confirmation_path
    else
      flash.now[:error] = "Error has occurred"
      render "new"
    end
  end


end
