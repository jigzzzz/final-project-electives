require './db/mysql_connector.rb'

class MenuItemRepository 


	def insert(name, price, category_id)
		client.query("INSERT INTO Items (name, price, category_id) VALUES ('#{name}', #{price}, #{category_id})")
		client.close
	end

	def update(id, name, price, category_id)
		client.query("'UPDATE Items SET name='#{name}', price='#{price}', category_id='#{category_id}' WHERE id='#{id}'")
		client.close
	end

	def delete(id)
		client.query("DELETE FROM Items WHERE id='#{id}'")
		client.close
	end

	def find_all
		raw_data = client.query("SELECT * FROM Items")
		client.close
		raw_data
	end

	def client
		return @client unless @client.nil? || @client.closed? 
		create_db_client
	end

end
