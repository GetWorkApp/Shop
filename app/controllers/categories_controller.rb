class CategoriesController < ApplicationController
  before_filter :find_category, :only => [:show, :edit, :update, :destroy]
  
  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end
  
  def create
    @category= Category.new(category_params)
    respond_to do |format|
      if @category.save
        flash[:notice] = "Category successfully saved"
        format.html { redirect_to @category }
      else
        flash[:notice] = "Category could not be saved"
        format.html { render :action => 'edit' }
      end
    end    
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @category.update_attributes(category_params)
        flash[:notice] = "Category successfully updated"
        format.html { redirect_to @category }
      else
        flash[:notice] = "Category could not be updated"
        format.html { render :action => 'edit' }
      end
    end
  end
  
  def destroy
    respond_to do |format|
      if @category.destroy
        flash[:notice] = "Category was successfully deleted"
        format.html { redirect_to categories_path }
      else
        flash[:notice] = "Category couldn't be deleted"
        format.html { redirect_to :action => 'index' }
      end
    end
  end
  
  private
  
  def find_category
    @category = Category.find(params[:id])
  end
  
  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end
