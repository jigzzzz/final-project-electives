require './repositories/food_oms_db/order_detail_repository.rb'

class OrderDetail

	attr_accessor :id, :order_id, :item_id, :qty

	@@order_detail_repository = OrderDetailRepository.new

	def initialize(params)
		@id = params["id"]
		@order_id = params["order_id"]
		@item_id = params["item_id"]
		@qty = params["qty"]
	end

	def find_all
		order_details = Array.new
		@@order_detail_repository.find_all.each do |item|
			order_details << OrderDetail.new({
				id: item["id"],
				order_id: item["order_id"],
				item_id: item["item_id"],
				qty: item["qty"]
			})
		end
		order_details
	end

	def delete_by_order_ids(ids) 
		return false unless delete_by_ids_valid?(ids)
		@@order_detail_repository.delete_by_order_ids(ids)
		return true
	end

	def delete_by_ids_valid?(ids)
		return false if ids.nil?
		return false if ids == ""
		true
	end

end