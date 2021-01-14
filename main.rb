require 'sinatra'
require 'sinatra/namespace'
require './controllers/category/category_controller.rb'

namespace '/category', :host_name => 'localhost' do
  controller = CategoryController.new
  get { controller.show_category(params) }
  get('/edit/:id') { controller.edit_category(params) }
  get('/add') { controller.edit_category(params) }
  post('/update/:id') { 
  	controller.update_category(params) 
  	redirect "/category"
  }
  post('/save') {}
  post('/delete/:id') {}
end