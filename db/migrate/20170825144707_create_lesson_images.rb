class CreateLessonImages < ActiveRecord::Migration[5.1]
  def change
    create_table :lesson_images do |t|
      t.string :photo
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
