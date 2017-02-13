class CreateDoshaproducts < ActiveRecord::Migration
  def change
    create_table :doshaproducts do |t|
      t.integer :product_id
      t.integer :dosha_id

      t.timestamps null: false
    end
  end
end
