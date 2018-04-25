class RemoveFieldsFromLessons < ActiveRecord::Migration[5.1]
  def change
    remove_column :lessons, :city
    remove_column :lessons, :street
    remove_column :lessons, :landmark
    remove_column :lessons, :phonenumber
    remove_column :lessons, :user_id
    remove_column :lessons, :photos
    remove_column :lessons, :country
    remove_column :lessons, :zip_code
  end
end
