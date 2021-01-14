require './models/category'

describe Category do
	describe 'models' do
		
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
end