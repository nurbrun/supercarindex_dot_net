class CreateCarModels < ActiveRecord::Migration
  def change
    create_table :car_models do |t|
	  t.references :supercar, index: true
      t.string :name
      t.timestamps null: false
    end
    add_foreign_key :car_models, :supercars
  end
end
