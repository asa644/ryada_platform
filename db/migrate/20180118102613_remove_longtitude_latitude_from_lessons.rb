class RemoveLongtitudeLatitudeFromLessons < ActiveRecord::Migration[5.1]
  def change
    remove_column :lessons, :longtitude
    remove_column :lessons, :latitude
  end
end
