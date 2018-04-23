class Attendee < ApplicationRecord
  extend FriendlyId
  friendly_id :email, use: :slugged
  belongs_to :event
end
