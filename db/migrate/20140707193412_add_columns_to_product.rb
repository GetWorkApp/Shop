class AddColumnsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :description, :text
    add_column :products, :permalink, :string
    add_column :products, :featured, :boolean
    add_column :products, :active, :boolean, :default => false
    add_column :products, :brand_id, :integer
    add_column :products, :meta_keywords, :string
    add_column :products, :meta_description, :string
  end
end
