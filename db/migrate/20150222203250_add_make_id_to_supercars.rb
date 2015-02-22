class AddMakeIdToSupercars < ActiveRecord::Migration
  def change
    add_column :supercars, :make_id, :integer
  end
end
