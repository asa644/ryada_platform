class RenameAvatarsListings < ActiveRecord::Migration[5.1]
  def change
    rename_column :listings, :avatars, :photos
  end
end
