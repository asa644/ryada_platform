class Listing < ApplicationRecord
  geocoded_by :address
  extend FriendlyId
  friendly_id :name, use: :slugged
  after_validation :geocode, if: :address_changed?
  mount_uploaders :photos, PhotoUploader
  # include AlgoliaSearch
  belongs_to :owner, :class_name => 'User', optional: true
  belongs_to :user,  :class_name => 'User'
  has_many :timings, dependent: :destroy
  accepts_nested_attributes_for :timings
  has_many :lessons, dependent: :destroy
  accepts_nested_attributes_for :lessons, reject_if: :all_blank, allow_destroy: true
  has_many :listing_photos, inverse_of: :listing, dependent: :destroy
  accepts_nested_attributes_for :listing_photos
  # has_many :service_listing, dependent: :destroy
  # has_many :services, through: :service_listing
  # has_many :tag_listing, dependent: :destroy
  # has_many :tags, through: :tag_listing
  # has_many :category_listing, dependent: :destroy
  # has_many :categories, through: :category_listing
  has_many :reviews
  enum status: [:pending, :rejected, :accepted]

  # algoliasearch do
  #   # :name, categories: [:name]
  # end
  # algoliasearch per_environment: true, :disable_indexing => Rails.env.test? do
  #   attribute :name
  # end
end
