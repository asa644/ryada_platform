class ChangeLessonNameinCategoryLesson < ActiveRecord::Migration[5.1]
  def change
    rename_column :category_lessons, :lessons_id, :lesson_id
  end
end
