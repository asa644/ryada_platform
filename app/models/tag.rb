class Tag < ApplicationRecord
  has_many :tag_listing
  has_many :listings, through: :tag_listing

end
