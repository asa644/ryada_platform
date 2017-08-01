class Service < ApplicationRecord
  include AlgoliaSearch
  has_many :service_listing, dependent: :destroy
  has_many :listings, through: :service_listing
  algoliasearch do
    # add_attribute :profile_licenses
    # add_attribute :profile_specialties
  end

end
