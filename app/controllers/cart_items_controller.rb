class CartItemsController < ApplicationController
  def index
    @cart_items = session_cart.cart_items
  end
  
  def create
    session_cart.save if session_cart.new_record?
    @cart_item = session_cart.cart_items.build(cart_item_params)
    respond_to do |format|
      if @cart_item.save
        flash[:notice] = "Product added to shopping cart successfully"
        format.html { redirect_to cart_items_path }
      else
        flash[:notice] = "Product could not be added to the shopping cart"
        format.html { redirect_to root_url }
      end
    end
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :variant_id)
  end
end
