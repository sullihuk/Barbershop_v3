class CreateBarbers < ActiveRecord::Migration[6.1]
  def change

  	create_table :barbers do |t|
	  		t.text :name
	  		
	  		t.timestamps
  		end

  		Barber.create :name => 'Saul Goodman'
  		Barber.create :name => 'Kim Wexler'
  		Barber.create :name => 'Chuck McGhill'

  end
end
