require 'mysql2'

def create_db_client
	client = Mysql2::Client.new(
		:host => '127.0.0.1',
		:username => 'goacademy',
		:password => '123456',
		:database => 'food_oms',
		:port => '3306'
		)
	client
end

def client
	return @client unless @client.nil? || @client.closed? 
	create_db_client
end