class DropListing < ActiveRecord::Migration[5.1]
  def change
    drop_table :listings
  end
end
