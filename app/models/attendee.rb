class Attendee < ApplicationRecord
  extend FriendlyId
  friendly_id :email, use: :slugged
end
