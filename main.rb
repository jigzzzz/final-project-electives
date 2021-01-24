require 'sinatra'
require 'sinatra/namespace'
require './controllers/category/category_controller.rb'
require './controllers/customer/customer_controller.rb'
require './controllers/menu/menu_controller.rb'

namespace '/category', :host_name => 'localhost' do
  controller = CategoryController.new
  get { controller.show_category(params) }
  get('/edit/:id') { controller.edit_category(params) }
  get('/add') { controller.add_category(params) }
  post('/update/:id') { 
  	controller.update_category(params) 
  	redirect "/category"
  }
  post('/save') {
  	controller.save_category(params)
  	redirect "/category"
  }
  get('/delete/:id') {
  	controller.delete_category(params)
  	redirect "/category"
  }
end

namespace '/customer', :host_name => 'localhost' do 
  controller = CustomerController.new
  get { controller.show_customer(params) }
  get('/add') { controller.add_customer(params) }
  post('/save') {
    controller.save_customer(params)
    redirect "/customer"
  }
  get('/edit/:id') { controller.edit_customer(params) }
  post('/update/:id') { 
    controller.update_customer(params) 
    redirect "/customer"
  }
  get('/delete/:id') {
    controller.delete_customer(params)
    redirect "/customer"
  }
end

namespace '/menu', :host_name => 'localhost' do 
  controller = MenuController.new
  get { controller.show_menu(params) }
  get('/add') { controller.add_menu(params) }
  post('/save') { 
    controller.save_menu(params) 
    redirect "/menu"
  }
  get('/edit/:id') { controller.edit_menu(params) }
  post('/update/:id') { 
    controller.update_menu(params) 
    redirect "/menu"
  }
  get('/delete/:id') {
    controller.delete_menu(params)
    redirect "/menu"
  }
end