class AddToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :country, :string
    add_column :lessons, :country, :string
    add_column :listings, :zip_code, :string
    add_column :lessons, :zip_code, :string
  end
end
