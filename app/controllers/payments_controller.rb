class PaymentsController < ApplicationController
  def new; end

  def payment_confirmation; end
  #   def apply_payment
  #     #get a form
  #     #@order = current_order.order_pending
  #     #amount_to_pay = current_order.subtotal
  #     #payment_applied = payment
  #       #if
  #         #payment == amount_to_pay
  #         #flash[:success] = "Thanks for your payment."
  #         #amount_to_pay = 0
  #         #current_order.order_paid
  #         #empty the cart, order_items.destroy
  #         #flash[:success] = "You will recieve your order and shipping confirmation shortly. hanks for shopping with Ghosty."
  #     #redirect_to ?_path
  #   end
  # #end
  #
  # # def order_paid
  # # end
  # #
  # # def order_pending
  # # end
  #
  #   def payment_fulfilled
  #     @order = current_order.order_paid
  #   end

  def update
    order = Order.find_by_id(params[:order_id])

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
