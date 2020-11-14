require './models/category.rb'

class CategoryController

	def show_category(params)
		category = Category.new({
			id: 0,
			name: "Minuman"
		})
		category.save
		rendered = ERB.new(File.read("./views/category/index.erb"))
		rendered.result(binding)
	end

end