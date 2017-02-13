class Composition < ActiveRecord::Base
	has_many :compositionproducts
  	has_many :products, through: :compositionproducts	
end
