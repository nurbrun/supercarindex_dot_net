class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.references :supercar, index: true
      t.string :name
      t.timestamps null: false
    end
    add_foreign_key :ranks, :supercars
  end
end