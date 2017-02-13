class CreateReceipeproducts < ActiveRecord::Migration
  def change
    create_table :receipeproducts do |t|
      t.integer :product_id
      t.integer :receipe_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
