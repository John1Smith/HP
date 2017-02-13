rails g scaffold Category name desc:text
rails g scaffold doshaproduct product_id:integer dosha_id:integer
rails g scaffold categorization product_id:integer category_id:integer

rails g scaffold Composition name desc:text unit
rails g scaffold compositionproduct product_id:integer composition_id:integer quantity:integer

rails g scaffold Season name desc:text
rails g scaffold Seasonproduct product_id:integer season_id:integer

rails g scaffold Receipe name desc:text 
rails g scaffold receipeproduct product_id:integer receipe_id:integer quantity:integer