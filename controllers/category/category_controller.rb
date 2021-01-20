require './models/category.rb'

class CategoryController

	def show_category(params)
		category = Category.new({})
		categories = category.find_all
		rendered = ERB.new(File.read("./views/category/index.erb"))
		rendered.result(binding)
	end

	def edit_category(params)
		category = Category.new({})
		category = category.find_by_id(params['id'])
		rendered = ERB.new(File.read("./views/category/edit.erb"))
		rendered.result(binding)
	end

	def add_category(params) 
		rendered = ERB.new(File.read("./views/category/add.erb"))
		rendered.result(binding)
	end

	def save_category(params)
		category = Category.new({
			name: params['name']
		})
		category.insert(category)
	end

	def update_category(params)
		category = Category.new({
			id: params['id'],
			name: params['name']
		})
		category.update(category)
	end

	def delete_category(params)
		category = Category.new({
			id: params['id']
		})
		category.delete(category)
	end

end