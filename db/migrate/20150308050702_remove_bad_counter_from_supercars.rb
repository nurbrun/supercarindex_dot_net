class RemoveBadCounterFromSupercars < ActiveRecord::Migration
  def change
  	remove_column :supercars, :ip_count  	
  	remove_column :supercars, :unique_ip_count
  end
end
