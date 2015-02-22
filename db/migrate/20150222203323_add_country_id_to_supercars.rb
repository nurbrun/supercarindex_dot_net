class AddCountryIdToSupercars < ActiveRecord::Migration
  def change
    add_column :supercars, :country_id, :integer
  end
end
