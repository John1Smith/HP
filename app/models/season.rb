class Season < ActiveRecord::Base
	has_many :seasonproducts
  	has_many :products, through: :seasonproducts	
end
