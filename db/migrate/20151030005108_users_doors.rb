class UsersDoors < ActiveRecord::Migration
  def change
  	create_table 'doors_users', :id => false do |t|
	    t.column :user_id, :integer
	    t.column :door_id, :integer
  	end
  end
end
