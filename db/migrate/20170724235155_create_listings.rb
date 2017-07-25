class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :description
      t.integer :status
      t.references :owner
      t.references :user
      t.string :city
      t.string :street
      t.string :landmark
      t.string :phonenumber
      t.float :longtitude
      t.float :latitude
      t.timestamps
    end
  end
end
