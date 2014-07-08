class ProductsController < ApplicationController
  before_filter :find_product, :only => [:show, :edit, :update, :destroy]
  
  def index
    @products = Product.all
  end
  
  def show
    new_cart_item
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    respond_to do |format| 
      if @product.save
        flash[:notice] = "Product was successfully created."
        format.html { redirect_to(@product) } 
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @product.update_attributes(product_params)
        flash[:notice] = "Product was successfully updated"
        format.html { redirect_to(@product) }
      else
        format.html { render action: "edit" }
      end
    end
  end
  
  def destroy
    respond_to do |format|
      if @product.destroy
        flash[:notice] = "Product was successfully deleted"
        format.html { redirect_to products_path }
      else
        flash[:notice] = "Product couldn't be deleted"
        format.html { redirect_to :action => 'index' }
      end
    end
  end
  
  private
  
  def product_params
    params.require(:product).permit(:name, :price, :category_id)
  end
  
  def find_product
    @product = Product.find(params[:id])
  end
  
  def new_cart_item
    @cart_item = CartItem.new
  end
end
