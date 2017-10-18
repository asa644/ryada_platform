class ListingPhoto < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :listing
  belongs_to :user, optional: true
end
