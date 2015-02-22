class CreateSpotTypes < ActiveRecord::Migration
  def change
    create_table :spot_types do |t|
	  t.references :supercar, index: true
      t.string :name
      t.timestamps null: false
    end
    add_foreign_key :spot_types, :supercars  end
end
