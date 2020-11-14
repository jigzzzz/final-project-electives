require 'sinatra'
require 'sinatra/namespace'
require './controllers/category/category_controller.rb'

namespace '/admin', :host_name => 'localhost' do
  controller = CategoryController.new
  get { 
  	controller.show_category(params)
  }
end