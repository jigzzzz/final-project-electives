require './models/customer.rb'
require './models/order.rb'
require './models/order_detail.rb'

class CustomerController 

	def show_customer(params)
		customer = Customer.new({})
		customers = customer.find_all
		rendered = ERB.new(File.read("./views/customer/index.erb"))
		rendered.result(binding)
	end

	def add_customer(params) 
		rendered = ERB.new(File.read("./views/customer/add.erb"))
		rendered.result(binding)
	end

	def save_customer(params)
		customer = Customer.new({
			name: params['name'],
			phone_number: params['phone_number']
		})
		customer.insert(customer)
	end

	def edit_customer(params)
		customer = Customer.new({})
		customer = customer.find_by_id(params['id'])
		
		order = Order.new({})
		orders = order.find_all_by_customer_id(customer.id)
		rendered = ERB.new(File.read("./views/customer/edit.erb"))
		rendered.result(binding)
	end

	def update_customer(params)
		customer = Customer.new({
			id: params['id'],
			name: params['name'],
			phone_number: params['phone_number']
		})
		customer.update(customer)
	end

	def delete_customer(params)
		customer = Customer.new({
			id: params['id']
		})

		order = Order.new({})
		orders = order.find_all_by_customer_id(customer.id)
		order_ids = orders.map(&:id).join(", ")

		# delete customer's order detail 
		order_detail = OrderDetail.new({})
		order_detail.delete_by_order_ids(order_ids)

		# delete customer's order
		order.delete_by_ids(order_ids)
		
		# delete customer
		customer.delete(customer)
	end

end