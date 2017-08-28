class AddAvatarsToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :photos, :json
  end
end
