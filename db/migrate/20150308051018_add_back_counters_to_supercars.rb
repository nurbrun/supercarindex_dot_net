class AddBackCountersToSupercars < ActiveRecord::Migration
  def change
  	remove_column :supercars, :session_count  
    add_column :supercars, :session_count, :integer
    add_column :supercars, :unique_ip_count, :integer
  end
end
