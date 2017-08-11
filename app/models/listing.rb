class Listing < ApplicationRecord
  include AlgoliaSearch

  belongs_to :owner, :class_name => 'User', optional: true
  belongs_to :user,  :class_name => 'User'
  has_many :timings
  has_many :service_listing, dependent: :destroy
  has_many :services, through: :service_listing
  has_many :tag_listing, dependent: :destroy
  has_many :tags, through: :tag_listing
  has_many :category_listing, dependent: :destroy
  has_many :categories, through: :category_listing
  has_many :reviews

  # algoliasearch do
  #   # :name, categories: [:name]
  # end
  algoliasearch per_environment: true, :disable_indexing => Rails.env.test? do
    attribute :name
  end
end
