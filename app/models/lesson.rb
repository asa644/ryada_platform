class Lesson < ApplicationRecord
  acts_as_schedulable :schedule
  # serialize :recurring, Hash
  has_many :lesson_exceptions
  belongs_to :user, optional: true
  belongs_to :listing
  has_many :category_lesson, dependent: :destroy
  has_many :categories, through: :category_lesson
  def calendar_lessons
      #start_date = start.beginning_of_month.beginning_of_week
    unless self.schedule.nil?
      unless self.schedule.until.nil?
        self.schedule.occurrences(self.schedule.until).map do |date|
          Lesson.new(id: id, name: name, start_time: date)
        end
      end
    end
  end
end

