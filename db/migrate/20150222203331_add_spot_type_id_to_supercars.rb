class AddSpotTypeIdToSupercars < ActiveRecord::Migration
  def change
    add_column :supercars, :spot_type_id, :integer
  end
end