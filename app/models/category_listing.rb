class CategoryListing < ApplicationRecord
  belongs_to :Category
  belongs_to :listing
end
