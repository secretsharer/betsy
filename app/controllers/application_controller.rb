class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

def current_order
  if !session[:order_id].nil?
    Order.find(session[:order_id])
  else
    Order.new
  end
end

  def render_404
    render file: "#{ Rails.root }/public/404.html", status: 404
  end

end
