require './models/category.rb'
require './db/mysql_connector.rb'
require 'mysql2'

describe Category do
	describe 'without db context' do
		describe 'insert_valid?' do
			context 'when initialized with valid input' do
				it 'should return true' do
					category = Category.new({
						name: 'Main Dish'
					})
					expect(category.insert_valid?).to eq(true)
				end
			end

			context 'when initialized with invalid input' do
				it 'should return false' do
					category = Category.new({
						id: 8
					})
					expect(category.insert_valid?).to eq(false)
				end
			end
		end

		describe 'update_valid?' do
			context 'when initialized with valid input' do
				it 'should return true' do
					category = Category.new({
						id: 1,
						name: 'Dessert'
					})
					expect(category.update_valid?).to eq(true)
				end
			end

			context 'when initialized with invalid input' do
				it 'should return false' do
					category = Category.new({
						id: 4
					})
					expect(category.update_valid?).to eq(false)
				end
			end
		end

		describe 'delete_valid?' do
			context 'when initialized with valid input' do
				it 'should return true' do
					category = Category.new({
						id: 1
					})
					expect(category.delete_valid?).to eq(true)
				end
			end

			context 'when initialized with invalid input' do
				it 'should return false' do
					category = Category.new({
						name: 'Main Dish'
					})
					expect(category.delete_valid?).to eq(false)
				end
			end
		end

	end

	describe 'with db context' do
		describe 'table categories is empty' do
			before (:all) do
				# client.query("TRUNCATE TABLE OrderDetails;")	
				# client.query("SET FOREIGN_KEY_CHECKS = 0;")
			end

			before (:each) do 
				client.query("TRUNCATE TABLE OrderDetails;")	
				client.query("SET FOREIGN_KEY_CHECKS = 0;")
				client.query("TRUNCATE TABLE Items;")
				client.query("TRUNCATE TABLE Categories;")
				client.query("SET FOREIGN_KEY_CHECKS = 1;")
				client.close
			end

			describe '.find_all' do
		        it 'should return empty' do
		          category = Category.new({})
		          categories = category.find_all
		          expect(categories).to eq([])
		        end
	      	end

	      	after (:all) do
	      	end
		end
	end
end