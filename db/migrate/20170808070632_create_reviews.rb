class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :star
      t.text :description
      t.references :listing, foreign_key: true
      t.timestamps
    end
  end
end
