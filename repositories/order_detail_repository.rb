require './db/mysql_connector.rb'

class OrderDetailRepository 

	def insert(order)
		client.query("INSERT INTO OrderDetails (order_date, total_order, customer_id) VALUES ('#{order.order_date}', #{order.total_order}, #{order.customer_id})")
		client.close
	end

	def update(order)
		client.query("UPDATE OrderDetails SET order_date='#{order.order_date}', total_order='#{order.total_order}', customer_id='#{order.category_id}' WHERE id='#{order.id}'")
		client.close
	end

	def delete(id)
		client.query("DELETE FROM OrderDetails WHERE id='#{id}'")
		client.close
	end

	def find_all
		raw_data = client.query("SELECT * FROM OrderDetails")
		client.close
		raw_data
	end

	def client
		return @client unless @client.nil? || @client.closed? 
		create_db_client
	end

end