class CreateCompositions < ActiveRecord::Migration
  def change
    create_table :compositions do |t|
      t.string :name
      t.text :desc
      t.string :unit

      t.timestamps null: false
    end
  end
end
