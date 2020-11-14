require './db/mysql_connector.rb'

class CategoryRepository 


	def insert(name)
		client.query("INSERT INTO Categories (name) VALUES ('#{name}')")
		client.close
	end

	def update(category)
		client.query("'UPDATE Categories SET name='#{category.name}' WHERE id='#{category.id}'")
		client.close
	end

	def delete(id)
		client.query("DELETE FROM Categories WHERE id='#{id}'")
		client.close
	end

	def find_all
		raw_data = client.query("SELECT * FROM Categories")
		client.close
		raw_data
	end

	def client
		return @client unless @client.nil? || @client.closed? 
		create_db_client
	end

end
