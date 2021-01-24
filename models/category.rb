require './repositories/food_oms_db/category_repository.rb'

class Category 
	attr_accessor :id, :name

	@@category_repository = CategoryRepository.new

	def initialize(param)
		@id = param[:id]
		@name = param[:name]
	end

	def find_all
		categories = Array.new
		@@category_repository.find_all.each do |category|
			categories << Category.new({
				id: category["id"],
				name: category["name"]
			})
		end
		categories
	end

	def find_by_id(id)
		categories = Array.new
		@@category_repository.find_by_id(id).each do |category|
			categories << Category.new({
				id: category["id"],
				name: category["name"]
			})
		end
		categories[0]
	end

	def insert(category) 
		return false unless insert_valid?
		@@category_repository.insert(category.name)
		true
	end

	def update(category)
		return false unless update_valid?
		@@category_repository.update(category)
		true
	end

	def delete(category)
		return false unless delete_valid?
		@@category_repository.delete(category.id)
		true
	end

	def insert_valid?
		return false if @name.nil?
		true
	end

	def update_valid?
		return false if @id.nil?
		return false if @name.nil?
		true
	end

	def delete_valid?
		return false if @id.nil?
		true
	end
end