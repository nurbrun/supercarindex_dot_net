class AddCounterToSupercars < ActiveRecord::Migration
  def change
    add_column :supercars, :ip_count, :integer
  end
end