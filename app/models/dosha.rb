class Dosha < ActiveRecord::Base
	has_many :doshaproducts
  	has_many :products, through: :doshaproducts
end
