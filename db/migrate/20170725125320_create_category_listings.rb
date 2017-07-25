class CreateCategoryListings < ActiveRecord::Migration[5.1]
  def change
    create_table :category_listings do |t|
      t.references :category, foreign_key: true
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
