class AddVariantIdToCartItem < ActiveRecord::Migration
  def change
    add_column :cart_items, :variant_id, :integer
  end
end
