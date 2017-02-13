class CreateSeasonproducts < ActiveRecord::Migration
  def change
    create_table :seasonproducts do |t|
      t.integer :product_id
      t.integer :season_id

      t.timestamps null: false
    end
  end
end
