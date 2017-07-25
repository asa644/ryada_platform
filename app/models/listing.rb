class Listing < ApplicationRecord
  belongs_to :owner, :class_name => 'User', optional: true
  belongs_to :user,  :class_name => 'User'
end
