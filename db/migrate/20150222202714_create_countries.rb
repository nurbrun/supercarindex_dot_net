class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
	  t.references :supercar, index: true
      t.string :name
      t.timestamps null: false
    end
    add_foreign_key :countries, :supercars
  end
end
