class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :description
      t.string :city
      t.string :street
      t.string :landmark
      t.string :phonenumber
      t.float :longtitude
      t.float :latitude
      t.references :user, foreign_key: true
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
