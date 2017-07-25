class Service < ApplicationRecord
  has_many :service_listing, dependent: :destroy
  has_many :listings, through: :service_listing
end
