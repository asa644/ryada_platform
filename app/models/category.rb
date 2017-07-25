class Category < ApplicationRecord
  has_many :category_listing
  has_many :listings, through: :category_listing
end
