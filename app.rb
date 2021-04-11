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
	validates :name, presence:true, length: {minimum: 2}
	validates :phone, presence:true
	validates :datestamp, presence:true
	validates :color, presence:true
	validates :barber, presence:true
end

class Barber < ActiveRecord::Base
end

class Message < ActiveRecord::Base
end



get '/' do
	
	erb :index
end

get '/visit' do
	@c = Client.new
	erb :visit
end

post '/visit' do
	
	
#По-ламерски
	# @username = params[:username]
	# @phone = params[:phone]
	# @date = params[:date]
	# @barber = params[:barber]
	# @color = params[:color]
	
	# Client.create :name => @username,
	# 			  :phone => @phone, 
	# 			  :datestamp => @date, 
	# 			  :barber => @barber,
	# 			  :color => @color

# По-нормальному

@c = Client.new params[:client]
@c.save

		if @c.save 
			@thanx = 'Блаходарочка!'
			erb :visit
		else
			@error = @c.errors.full_messages.first
			erb :visit
		end	

	#erb :visit
		
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