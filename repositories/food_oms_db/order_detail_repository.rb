require './db/mysql_connector.rb'

class OrderDetailRepository 

	def insert(order_detail)
		client.query("INSERT INTO OrderDetails (order_id, item_id, qty) VALUES ('#{order_detail.order_id}', #{order_detail.item_id}, #{order_detail.qty})")
		client.close
	end

	def update(order_detail)
		client.query("UPDATE OrderDetails SET order_id='#{order_detail.order_id}', item_id='#{order_detail.item_id}', qty='#{order_detail.qty}' WHERE id='#{order_detail.id}'")
		client.close
	end

	def delete(id)
		client.query("DELETE FROM OrderDetails WHERE id='#{id}'")
		client.close
	end

	def delete_by_order_ids(ids)
		client.query("DELETE FROM OrderDetails WHERE order_id IN (#{ids})")
		client.close
	end

	def find_all
		raw_data = client.query("SELECT * FROM OrderDetails")
		client.close
		raw_data
	end

	def find_all_by_order_id(order_id)
		raw_data = client.query("SELECT * FROM OrderDetails WHERE order_id='#{order_id}")
		client.close
		raw_data
	end

	def client
		return @client unless @client.nil? || @client.closed? 
		create_db_client
	end

end