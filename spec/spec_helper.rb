# require 'sequel'
# require 'database_cleaner-sequel'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  # db_host = '127.0.0.1'
  # db_port = '3306'
  # db_name = 'food_oms'
  # db_username = 'goacademy'
  # db_password = '123456'
  # uri = "mysql2://#{db_username}:#{db_password}@#{db_host}:#{db_port}/#{db_name}"
  # DatabaseCleaner[:sequel].db = Sequel.connect(uri)
  # DatabaseCleaner[:sequel].strategy = :truncation

  # config.before(:all) do
  #   DatabaseCleaner[:sequel].start
  #   DatabaseCleaner[:sequel].clean
  # end

  # config.before(:each) do
  #   DatabaseCleaner[:sequel].start
  # end

  # config.after(:each) do
  #   DatabaseCleaner[:sequel].clean
  # end

end
