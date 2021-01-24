require './db/mysql_connector.rb'

class CustomerRepository 


	def insert(customer)
		client.query("INSERT INTO Customers (name, phone_number) VALUES ('#{customer.name}', #{customer.phone_number})")
		client.close
	end

	def update(customer)
		client.query("UPDATE Customers SET name='#{customer.name}', phone_number='#{customer.phone_number}'  WHERE id='#{customer.id}'")
		client.close
	end

	def delete(id)
		client.query("DELETE FROM Customers WHERE id='#{id}'")
		client.close
	end

	def find_all
		raw_data = client.query("SELECT * FROM Customers")
		client.close
		raw_data
	end

	def find_by_id(id)
		raw_data = client.query("SELECT * FROM Customers WHERE id='#{id}'")
		client.close
		raw_data
	end

	def client
		return @client unless @client.nil? || @client.closed? 
		create_db_client
	end

end
