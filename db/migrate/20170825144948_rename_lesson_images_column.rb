class RenameLessonImagesColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :lesson_images, :listing_id, :lesson_id
  end
end
