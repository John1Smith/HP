class Seasonproduct < ActiveRecord::Base
	 belongs_to :product
  	 belongs_to :season		
end
