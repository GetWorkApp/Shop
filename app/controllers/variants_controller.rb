class VariantsController < ApplicationController
  before_filter :find_variant, :only => [:show, :edit, :update, :destroy]
  
  def index
    @variants = Variant.all
  end

  def show
  end

  def new
    @variant = Variant.new
  end
  
  def create
    @variant = Variant.new(variant_params)
    respond_to do |format|
      if @variant.save
        flash[:notice] = "Variant successfully saved"
        format.html { redirect_to @variant }
      else
        flash[:notice] = "Variant could not be saved"
        format.html { render :action => 'edit' }
      end
    end    
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @variant.update_attributes(variant_params)
        flash[:notice] = "Variant successfully updated"
        format.html { redirect_to @variant }
      else
        flash[:notice] = "Variant could not be updated"
        format.html { render :action => 'edit' }
      end
    end
  end
  
  def destroy
    respond_to do |format|
      if @variant.destroy
        flash[:notice] = "Variant was successfully deleted"
        format.html { redirect_to variants_path }
      else
        flash[:notice] = "Variant couldn't be deleted"
        format.html { redirect_to :action => 'index' }
      end
    end
  end
  
  private
  
  def find_variant
    @variant = Variant.find(params[:id])
  end
  
  def variant_params
    params.require(:variant).permit(:name, :product_id)
  end
end