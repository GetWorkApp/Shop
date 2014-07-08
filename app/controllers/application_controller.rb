class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :session_cart
  
  private
  def session_cart
    return @session_cart if defined?(@session_cart)
    session_cart!
  end
 
  def session_cart!
    if cookies[:cart_id]
      @session_cart = Cart.find_by_id(cookies[:cart_id])
      unless @session_cart
        @session_cart = Cart.create
        cookies[:cart_id] = @session_cart.id
    end
    else
      @session_cart = Cart.create
      cookies[:cart_id] = @session_cart.id
    end
    @session_cart
  end
end
