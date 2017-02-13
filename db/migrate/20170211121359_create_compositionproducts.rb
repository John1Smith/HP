class CreateCompositionproducts < ActiveRecord::Migration
  def change
    create_table :compositionproducts do |t|
      t.integer :product_id
      t.integer :composition_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
