class Category < ApplicationRecord
  has_many :category_listing, dependent: :destroy
  has_many :listings, through: :category_listing
end
