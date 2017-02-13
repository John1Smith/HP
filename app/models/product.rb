class Product < ActiveRecord::Base
	has_many :categorizations
	has_many :categories, through: :categorizations

	has_many :doshaproducts
	has_many :doshas, through: :doshaproducts  	 

	has_many :compositionproducts
	has_many :compositions, through: :compositionproducts  	 
	
	has_many :seasonproducts
	has_many :seasons, through: :seasonproducts  	 

	has_many :receipeproducts
	has_many :receipes, through: :receipeproducts  
end

