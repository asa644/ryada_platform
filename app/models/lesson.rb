class Lesson < ApplicationRecord
  acts_as_schedulable :schedule
  # serialize :recurring, Hash
  has_many :lesson_exceptions
  belongs_to :user, optional: true
  belongs_to :listing
  # def recurring=(value)
  #   if RecurringSelect.is_valid_rule?(value)
  #     super(RecurringSelect.dirty_hash_to_rule(value).to_hash)
  #   else
  #     super(nil)
  #   end
  # end

  # def rule
  #   IceCube::Rule.from_hash recurring
  # end

  # def schedule(start)
  #   schedule = IceCube::Schedule.new(start)
  #   schedule.add_recurrence_rule(rule)

  #   lesson_exceptions.each do |exception|
  #     schedule.add_exception_time(exception.time)
  #   end

  #   schedule
  # end

  def calendar_lessons
      #start_date = start.beginning_of_month.beginning_of_week
    unless self.schedule.nil?
      self.schedule.occurrences(self.schedule.until).map do |date|
        Lesson.new(id: id, name: name, start_time: date)
      end
    end
  end
end

