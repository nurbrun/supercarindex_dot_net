class CreateSupercars < ActiveRecord::Migration
  def change
    create_table :supercars do |t|
      t.string :supercar_url
      t.text :html
      t.string :author_name
      t.string :thumbnail_url
      t.string :title

      t.timestamps null: false
    end
  end
end
