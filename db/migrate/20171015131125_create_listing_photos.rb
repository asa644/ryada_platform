class CreateListingPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :listing_photos do |t|
      t.string :photo
      t.references :listing, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
