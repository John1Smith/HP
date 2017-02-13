class Doshaproduct < ActiveRecord::Base
	 belongs_to :product
  	 belongs_to :dosha	
end
