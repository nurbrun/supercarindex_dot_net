class AddCarModelIdToSupercars < ActiveRecord::Migration
  def change
    add_column :supercars, :car_model_id, :integer
  end
end
