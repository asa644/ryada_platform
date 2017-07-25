class Listing < ApplicationRecord
  belongs_to :owner, :class_name => 'User', optional: true
  belongs_to :user,  :class_name => 'User'
  has_many :timings
  has_many :service_listing
  has_many :services, through: :service_listing

end
