class CreateResponds < ActiveRecord::Migration[5.1]
  def change
    create_table :responds do |t|
      t.text :description
      t.references :review, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
