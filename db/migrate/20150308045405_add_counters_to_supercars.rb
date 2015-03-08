class AddCountersToSupercars < ActiveRecord::Migration
  def change
    add_column :supercars, :session_count, :integer
    add_column :supercars, :unique_ip_count, :integer
  end
end

