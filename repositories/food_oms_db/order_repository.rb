require './db/mysql_connector.rb'

class OrderRepository 


	def insert(order_date, total_order, customer_id)
		client.query("INSERT INTO Orders (order_date, total_order, customer_id) VALUES ('#{order_date}', #{total_order}, #{customer_id})")
		client.close
	end

	def update(id, order_date, total_order, customer_id)
		client.query("UPDATE Orders SET order_date='#{order_date}', total_order='#{total_order}', customer_id='#{category_id}' WHERE id='#{id}'")
		client.close
	end

	def delete(id)
		client.query("DELETE FROM Orders WHERE id='#{id}'")
		client.close
	end

	def find_all
		raw_data = client.query("SELECT * FROM Orders")
		client.close
		raw_data
	end

	def client
		return @client unless @client.nil? || @client.closed? 
		create_db_client
	end

end
