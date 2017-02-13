# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



DELETE_ALL_PROD   = false
DELETE_ALL_CAT    = false
DELETE_ALL_DOSHA  = false
DELETE_ALL_SEASON = false
DELETE_ALL_COMP   = false

DELETE_ALL_PROD_COMP = false


def gen_prod
	file1 = File.read("#{Rails.root}/public/p11.json")
	data_hash1 = JSON.parse(file1)

	if DELETE_ALL_PROD
		Product.delete_all
	end	
	data_hash1.each do |prod|
		product = Product.new
		product.name    = prod['name']
		product.desc    = prod['description']
		product.img_url = prod['img_url']
		product.save

		p product
	end
	
end

def gen_cat
	if DELETE_ALL_CAT
		Category.delete_all
	end	

	arr = "Крахмалы,Белки,Зелень,Овощи,Орехи и сухофрукты,Фрукты,Жиры,Сахара,Углеводы,Щелочные,Кислые,Нейтральные"
	arr = arr.split(',')
	arr.each do |cat|
		category       = Category.new
		category.name  = cat
		category.save

		p category
	end
end

def gen_dosha
	if DELETE_ALL_DOSHA
		Dosha.delete_all
	end	

	arr = "Вата,Питта,Капха,Вата-Питта,Питта-Капха,Капха-Вата"
	arr = arr.split(',')
	arr.each do |el|
		obj       = Dosha.new
		obj.name  = el
		obj.save

		p obj
	end
end


def gen_season
	if DELETE_ALL_SEASON
		Season.delete_all
	end	

	arr = "Январь,Февраль,Март,Апрель,Май,Июнь,Июль,Август,Сентябрь,Октябрь,Ноябрь,Декабрь"
	arr = arr.split(',')
	arr.each do |el|
		obj       = Season.new
		obj.name  = el
		obj.save

		p obj
	end
end

def gen_comp
	file1 = File.read("#{Rails.root}/public/composition.json")
	data_hash1 = JSON.parse(file1)

	if DELETE_ALL_COMP
		Composition.delete_all
	end	
	data_hash1.each do |c|
		comp = Composition.new
		comp.name    = c['name']
		comp.desc    = c['desc'] ? c['desc'] : ''+c['href']
		comp.unit    = c['unit']
		comp.save

		p comp
	end
	
end

# Соответствия Product Composition 
def gen_prod_comp
	file = File.read("#{Rails.root}/public/p11.json")
	data_hash = JSON.parse(file)

	if DELETE_ALL_PROD_COMP
		Compositionproduct.delete_all
	end	
	data_hash.each do |prod|

		product = Product.find_by_name prod['name']
		# binding.pry
		comps   = prod['include100g']
		p product.name

		comps.each do |comp|
			composition = Composition.find_by_name(comp['name'])
			p "             name: #{composition.name}"
			p "             unit: #{composition.unit}"
			# p "quantity: #{composition.quantity}"
			# p "href: #{composition.href}"

			cp = Compositionproduct.new
			cp.product     = product
			cp.composition = composition
			cp.quantity    = comp['quantity']
			cp.save
		end

	end
	
end

def gen_repl_path
	file1 = File.read("#{Rails.root}/public/p11.json")
	file2 = File.read("#{Rails.root}/public/images/imgs_all.json")
	data_hash1 = JSON.parse(file1)
    data_hash2 = JSON.parse(file2)

	data_hash2.each do |prod|
		product = Product.find_by_name prod['name']
		img_path = "#{Rails.root}/public/images/#{prod['file_name']}"
		product.img_url = prod['file_name']
		product.save

		p "#{product.name} : #{product.img_url}"
		# p prod['name'] 
	end
	
end
# gen_prod
# gen_cat
# gen_dosha
# gen_season
# gen_comp

# gen_prod_comp

gen_repl_path