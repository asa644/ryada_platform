class Lesson < ApplicationRecord
  # acts_as_schedulable :schedule
  serialize :recurring, Hash
  # has_many :lesson_exceptions
  belongs_to :user, optional: true
  belongs_to :listing
  has_many :bookings, dependent: :destroy
  has_many :category_lesson, dependent: :destroy
  has_many :categories, through: :category_lesson
  def recurring=(value)
    if RecurringSelect.is_valid_rule?(value)
      super(RecurringSelect.dirty_hash_to_rule(value).to_hash)
    else
      super(nil)
    end
  end

  def rule
    IceCube::Rule.from_hash recurring
  end

  def schedule(start)
    schedule = IceCube::Schedule.new(start)
    schedule.add_recurrence_rule(rule)

    # event_exceptions.each do |exception|
    #   schedule.add_exception_time(exception.time)
    # end

    schedule
  end
  def occurrences
    self.schedule(Time.now).occurrences(Time.now + 1.week)
  end
  def calendar_lessons(start)
    if recurring.empty?
      [self]
    else
      #start_date = start.beginning_of_month.beginning_of_week
      end_date = start.end_of_month.end_of_week
      schedule(start_time).occurrences(end_date).map do |date|
        Lesson.new(id: id, name: name, start_time: start_time, end_time: end_time)
      end
    end
  end

  # def calendar_lessons
  #     #start_date = start.beginning_of_month.beginning_of_week
  #   unless self.schedule.nil?
  #     unless self.schedule.until.nil?
  #       self.schedule.occurrences(self.schedule.until).map do |date|
  #         Lesson.new(id: id, name: name, start_time: date)
  #       end
  #     end
  #   end
  # end
end

