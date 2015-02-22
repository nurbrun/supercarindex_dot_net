class AddCityIdToSupercars < ActiveRecord::Migration
  def change
    add_column :supercars, :city_id, :integer
  end
end
