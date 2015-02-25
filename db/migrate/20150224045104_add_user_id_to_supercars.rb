class AddUserIdToSupercars < ActiveRecord::Migration
  def change
    add_column :supercars, :user_id, :integer
  end
end

