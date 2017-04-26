class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :setup_session_and_cart
  before_action :require_login

  helper_method :current_merchant

  #trying to setup a guest session and cart at the start of running the website but the values in the session hash don't persist (so a new cart is created every time you do anything)
  def setup_session_and_cart
    if !session[:merchant_id]
      if session[:guest_id] == nil
        session[:guest_id] = "guest"
        order = Order.create
        session[:order_id] = order.id
      end
    end
  end

  def require_login
    if current_merchant.nil?
      flash[:error] = "You must be logged in to do that"
      redirect_to root_path
    end
  end


  def render_404
    render file: "#{ Rails.root }/public/404.html", status: 404
  end

  def current_merchant
    if session[:merchant_id]
      @login_merchant = Merchant.find_by(id: session[:merchant_id])
    end
  end

  def current_order
    if session[:order_id] != nil
      Order.find_by_id(session[:order_id])
    else
      order = Order.create
      session[:order_id] = order.id
    end
  end

end
