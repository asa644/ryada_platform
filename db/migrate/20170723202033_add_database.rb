class AddDatabase < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :description
      t.integer :status
      t.time :openning_hour
      t.time :closing_hour
      t.string :address
      t.references :owner
      t.references :user
      t.string :street_address
      t.float :longitude
      t.float :latitude
      t.timestamps
    end
  end
end
