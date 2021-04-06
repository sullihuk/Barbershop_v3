#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'



before do 
	@barbers = Barber.order "created_at DESC"
end



set :database, { adapter: 'sqlite3', database: 'barbershop.db' }

class Client < ActiveRecord::Base 
end

class Barber < ActiveRecord::Base
end

class Message < ActiveRecord::Base
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
	@barber = params[:barber]
	@color = params[:color]
	
	Client.create :name => @username,
				  :phone => @phone, 
				  :datestamp => @date, 
				  :barber => @barber,
				  :color => @color

	

	erb :visit
		
end

get '/contacts' do
	erb :contacts
end

post '/contacts' do

	@email = params[:email]
	@message = params[:message]

	Message.create :mail => @email,
				   :message => @message	

	erb :contacts
end