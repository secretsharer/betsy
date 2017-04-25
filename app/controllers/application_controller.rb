class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :setup_session_and_cart

  #trying to setup a guest session and cart at the start of running the website but the values in the session hash don't persist (so a new cart is created every time you do anything)
  def setup_session_and_cart
    if !session[:user_id]
      if session[:guest_id] == nil
        session[:guest_id] = 1
        @order = Order.create
      end
    end
  end

  # before_action :require_login
  # helper_method :current_order
  #
  #
  # helper_method :current_user
  # # :find_book, :only [:show, :edit, :update]
  #
  #
  # def require_login
  #   #See if we have a logged-in user (probably using session)
  #   if !session[:user_id]
  #     #if not logged in
  #     #show message about not being logged in and to root route
  #     flash[:warning] = "must be logged in to do that shit"
  #     redirect_to root_path
  #   end
  # end
  #
  # def current_user
  #   #MEMOIZE: Storing something so you don't have to retrieve it all the time. If we MEMOIZE, we can query the database one time for one request cycle, so we can use the current user concept multiple times in same reqcyc
  #   @logged_in_user ||= User.find(session[:user_id]) if session[:user_id]
  # end
  #
  # def current_order
  #   if !session[:order_id].nil?
  #     Order.find(session[:order_id])
  #   else
  #     Order.new
  #   end
  # end

  def render_404
    render file: "#{ Rails.root }/public/404.html", status: 404
  end

  def current_order
    if session[:order_id] != nil
      Order.find_by_id(session[:order_id])
    else
      Order.create
    end
  end

end
