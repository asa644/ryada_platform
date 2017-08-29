class RenameLongitudeToLongtitude < ActiveRecord::Migration[5.1]
  def change
    rename_column :listings, :longtitude, :longitude
  end
end
