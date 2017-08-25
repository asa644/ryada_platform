class AddOwnerPhoneToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :ownerphone, :string
  end
end
