class ResetIpCounterFromSupercars < ActiveRecord::Migration
  def change
  	remove_column :supercars, :unique_ip_count  
    add_column :supercars, :unique_ip_count, :integer
  end
end