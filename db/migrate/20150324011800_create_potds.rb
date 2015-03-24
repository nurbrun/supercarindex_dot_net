class CreatePotds < ActiveRecord::Migration
  def change
    create_table :potds do |t|

      t.timestamps null: false
    end
  end
end
