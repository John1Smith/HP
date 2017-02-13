class Receipeproduct < ActiveRecord::Base
	 belongs_to :product
  	 belongs_to :receipe	
end
