class PaymentsController < ApplicationController


  def apply_payment
    #get a form
    #@order = current_order.order_pending
    #amount_to_pay = current_order.subtotal
    #payment_applied = payment
      #if
        #payment == amount_to_pay
        #flash[:success] = "Thanks for your payment."
        #amount_to_pay = 0
        #current_order.order_paid
        #empty the cart, order_items.destroy
        #flash[:success] = "You will recieve your order and shipping confirmation shortly. hanks for shopping with Ghosty."
    #redirect_to ?_path
  end
#end

# def order_paid
# end
#
# def order_pending
# end

  def payment_fulfilled
    @order = current_order.order_paid
  end
end
