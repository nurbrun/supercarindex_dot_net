class AddAttributesToPotd < ActiveRecord::Migration
  def change
    add_column :potds, :make, :string
    add_column :potds, :car_model, :string
    add_column :potds, :city, :string
    add_column :potds, :country, :string
    add_column :potds, :supercar_url, :string
    add_column :potds, :html, :text
    add_column :potds, :author_name, :string
    add_column :potds, :thumbnail_url, :string
    add_column :potds, :title, :string   
  end
end
