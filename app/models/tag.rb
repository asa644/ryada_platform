class Tag < ApplicationRecord
  include AlgoliaSearch
  has_many :tag_listing, dependent: :destroy
  has_many :listings, through: :tag_listing
  algoliasearch do
    # add_attribute :profile_licenses
    # add_attribute :profile_specialties
  end

end
