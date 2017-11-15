class CategoryLesson < ApplicationRecord
  belongs_to :category
  belongs_to :lesson
end
