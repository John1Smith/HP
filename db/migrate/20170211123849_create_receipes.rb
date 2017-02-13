class CreateReceipes < ActiveRecord::Migration
  def change
    create_table :receipes do |t|
      t.string :name
      t.text :desc

      t.timestamps null: false
    end
  end
end
