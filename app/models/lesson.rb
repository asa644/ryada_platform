class Lesson < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :listing
  has_many :timings
end
