#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'




set :database, { adapter: 'sqlite3', database: 'barbershop.db' }

class Client < ActiveRecord::Base 
end

class Barber < ActiveRecord::Base
end

before do 
	@barbers = Barber.order "created_at DESC"
end


get '/' do
	
	erb :index
end

get '/visit' do
	erb :visit
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@date = params[:date]
	@barbers = params[:barbers]
	@color = params[:color]
	

	

	erb :visit
		
end