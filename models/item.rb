require './repositories/food_oms_db/item_repository.rb'

class Item

	attr_accessor :id, :name, :price, :category_id

	@@item_repository = ItemRepository.new

	def initialize(params)
		@id = params[:id]
		@name = params[:name]
		@price = params[:price]
		@category_id = params[:category_id]
	end

	def find_all
		items = Array.new
		@@item_repository.find_all.each do |item|
			items << Item.new({
				id: item["id"],
				name: item["name"],
				price: item["price"],
				category_id: item["category_id"]
			})
		end
		items
	end

	def find_by_id(id)
		items = Array.new
		@@item_repository.find_by_id(id).each do |item|
			items << Item.new({
				id: item["id"],
				name: item["name"],
				price: item["price"],
				category_id: item["category_id"]
			})
		end
		items[0]
	end

	def insert(item) 
		return false unless insert_valid?
		@@item_repository.insert(item)
		true
	end

	def delete(item) 
		return false unless delete_valid?
		@@item_repository.delete(item.id)
		true
	end

	def update(item) 
		return false unless update_valid?
		@@item_repository.update(item)
		true
	end

	def insert_valid?
		return false if @name.nil?
		return false if @price.nil?
		return false if @category_id.nil?
		true
	end

	def update_valid?
		return false if @id.nil?
		return false if @name.nil?
		return false if @price.nil?
		return false if @category_id.nil?
		true
	end

	def delete_valid?
		return false if @id.nil?
		true
	end

end