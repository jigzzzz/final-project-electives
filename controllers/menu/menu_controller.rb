require './models/item.rb'

class MenuController 

	def show_menu(params)
		# get all menu items
		item = Item.new({})
		items = item.find_all

		# get all categories
		category = Category.new({})
		categories = category.find_all

		rendered = ERB.new(File.read("./views/menu/index.erb"))
		rendered.result(binding)
	end

	def add_menu(params)
		# get all categories
		category = Category.new({})
		categories = category.find_all
		
		rendered = ERB.new(File.read("./views/menu/add.erb"))
		rendered.result(binding)
	end

	def edit_menu(params)
		# get all menu items
		item = Item.new({})
		item = item.find_by_id(params["id"])

		# get all categories
		category = Category.new({})
		categories = category.find_all
		
		rendered = ERB.new(File.read("./views/menu/edit.erb"))
		rendered.result(binding)
	end

	def update_menu(params)
		item = Item.new({
			id: params["id"],
			name: params["name"],
			price: params["price"],
			category_id: params["category"]
		})
		item.update(item)
	end

	def save_menu(params)
		item = Item.new({
			name: params["name"],
			price: params["price"],
			category_id: params["category"]
		})
		item.insert(item)
	end

	def delete_menu(params)
		item = Item.new({
			id: params["id"]
		})
		item.delete(item)
	end

end