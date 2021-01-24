require './repositories/food_oms_db/order_repository.rb'

class Order

	attr_accessor :id, :order_date, :total_order, :customer_id

	@@order_repository = OrderRepository.new

	def initialize(params)
		@id = params[:id]
		@order_date = params[:order_date]
		@total_order = params[:total_order]
		@customer_id = params[:customer_id]
	end

	def find_all
		orders = Array.new
		@@order_repository.find_all.each do |order|
			orders << Order.new({
				id: order["id"],
				order_date: order["order_date"],
				total_order: order["total_order"],
				customer_id: order["customer_id"]
			})
		end
		return orders
	end

	def find_all_by_customer_id(customer_id)
		orders = Array.new
		@@order_repository.find_all_by_customer_id(customer_id).each do |order|
			orders << Order.new({
				id: order["id"],
				order_date: order["order_date"],
				total_order: order["total_order"],
				customer_id: order["customer_id"]
			})
		end
		return orders
	end

	def delete_by_ids(ids) 
		return false unless delete_by_ids_valid?(ids)
		@@order_repository.delete_by_ids(ids)
		return true
	end

	def delete_by_ids_valid?(ids)
		return false if ids.nil?
		return false if ids == ""
		true
	end

end