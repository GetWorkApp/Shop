class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :name
      
      t.timestamps
    end
  end
end
