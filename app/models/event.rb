class Event < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :attendees
end
