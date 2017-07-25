class Tag < ApplicationRecord
  has_many :tag_listing, dependent: :destroy
  has_many :listings, through: :tag_listing
end
