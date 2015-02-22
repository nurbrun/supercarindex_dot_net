class CreateMakes < ActiveRecord::Migration
  def change
    create_table :makes do |t|
      t.references :supercar, index: true
      t.string :name
      t.timestamps null: false
    end
    add_foreign_key :makes, :supercars
  end
end
