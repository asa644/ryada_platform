class DestroyLessonImages < ActiveRecord::Migration[5.1]
  def change
    drop_table :listing_images
    drop_table :lesson_images
  end
end
