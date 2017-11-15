class CreateCategoryLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :category_lessons do |t|
      t.references :categories
      t.references :lessons, foreign_key: true
      t.timestamps
    end
  end
end
