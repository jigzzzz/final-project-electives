require './repositories/food_oms_db/customer_repository.rb'

class Customer 
	attr_accessor :id, :name, :phone_number

	@@customer_repository = CustomerRepository.new

	def initialize(param)
		@id = param[:id]
		@name = param[:name]
		@phone_number = param[:phone_number]
	end

	def find_all
		customers = Array.new
		@@customer_repository.find_all.each do |customer|
			customers << Customer.new({
				id: customer["id"],
				name: customer["name"],
				phone_number: customer["phone_number"]
			})
		end
		return customers
	end

	def find_by_id(id)
		customers = Array.new
		@@customer_repository.find_by_id(id).each do |customer|
			customers << Customer.new({
				id: customer["id"],
				name: customer["name"],
				phone_number: customer["phone_number"]
			})
		end
		return customers[0]
	end

	def insert(customer) 
		return false unless insert_valid?
		@@customer_repository.insert(customer)
		return true
	end

	def update(customer) 
		return false unless update_valid?
		@@customer_repository.update(customer)
		return true
	end

	def delete(customer)
		return false unless delete_valid?
		@@customer_repository.delete(customer.id)
		return true
	end

	def insert_valid?
		return false if @name.nil?
		return false if @phone_number.nil?
		true
	end

	def update_valid?
		return false if @id.nil?
		return false if @name.nil?
		return false if @phone_number.nil?
		true
	end

	def delete_valid?
		return false if @id.nil?
		true
	end

end