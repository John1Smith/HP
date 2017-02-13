class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :name
      t.text :desc

      t.timestamps null: false
    end
  end
end
