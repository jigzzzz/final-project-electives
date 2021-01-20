require './db/mysql_connector.rb'

class ItemRepository 


	def insert(item)
		client.query("INSERT INTO Items (name, price, category_id) VALUES ('#{item.name}', #{item.price}, #{item.category_id})")
		client.close
	end

	def update(item)
		client.query("UPDATE Items SET name='#{item.name}', price='#{item.price}', category_id='#{item.category_id}' WHERE id='#{item.id}'")
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

	def find_by_id(id)
		raw_data = client.query("SELECT * FROM Items WHERE id='#{id}'")
		client.close
		raw_data
	end

	def client
		return @client unless @client.nil? || @client.closed? 
		create_db_client
	end

end
