class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :desc
      t.string :img_url

      t.timestamps null: false
    end
  end
end
