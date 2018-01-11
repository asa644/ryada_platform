class AddStatusToListing < ActiveRecord::Migration[5.1]
  def change
    remove_column :listings, :status
    add_column :listings, :status, :integer, default: "pending"
  end
end
