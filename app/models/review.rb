class Review < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  has_many :responds
end
