class CreateMessages < ActiveRecord::Migration[6.1]
  def change


  		create_table :messages do |t|
  		
	  		t.text :mail
	  		t.text :message
	  		t.timestamps
  		end
  

  end
end
