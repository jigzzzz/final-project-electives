require './repositories/category_repository.rb'

class Category 
	attr_accessor :id, :name

	@@category_repository = CategoryRepository.new

	def initialize(param)
		@id = param[:id]
		@name = param[:name]
	end

	def save 
		return false unless valid?
			
		@@category_repository.insert(@name)
	end

	def valid?
		return false if @name.nil?
		true
	end
end