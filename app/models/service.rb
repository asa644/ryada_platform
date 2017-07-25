class Service < ApplicationRecord
  has_many :service_listing
  has_many :listings, through: :service_listing
end
