class Category < ApplicationRecord
  include AlgoliaSearch
  has_many :category_listing, dependent: :destroy
  has_many :listings, through: :category_listing
  algoliasearch do
    # add_attribute :profile_licenses
    # add_attribute :profile_specialties
  end
end
