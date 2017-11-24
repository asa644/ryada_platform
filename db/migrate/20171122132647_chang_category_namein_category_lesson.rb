class ChangCategoryNameinCategoryLesson < ActiveRecord::Migration[5.1]
  def change
    rename_column :category_lessons, :categories_id, :category_id
  end
end
