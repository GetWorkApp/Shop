class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.integer :product_id
      t.string :name
      t.decimal :price, :precision => 8, :scale => 2, :default => 0.0,  :null => false
      t.decimal :cost, :precision => 8, :scale => 2, :default => 0.0,  :null => false
      t.integer :count_on_hand, :default => 0, :null => false

      t.timestamps
    end
  end
end
