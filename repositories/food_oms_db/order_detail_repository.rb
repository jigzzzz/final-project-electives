require './db/mysql_connector.rb'

class OrderDetailRepository 

	def insert(order_id, item_id, qty)
		client.query("INSERT INTO OrderDetails (order_id, item_id, qty) VALUES ('#{order_id}', #{item_id}, #{qty})")
		client.close
	end

	def update(id, order_id, item_id, qty)
		client.query("UPDATE OrderDetails SET order_id='#{order_id}', item_id='#{item_id}', qty='#{qty}' WHERE id='#{id}'")
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