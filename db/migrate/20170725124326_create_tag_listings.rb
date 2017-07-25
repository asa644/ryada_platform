class CreateTagListings < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_listings do |t|
      t.references :tag, foreign_key: true
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
