class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable, :confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :owner_listings, :class_name => 'Listing', :foreign_key => 'user_id'
  has_many :user_listings, :class_name => 'Listing', :foreign_key => 'owner_id'
  has_many :reviews
  has_many :responds
  mount_uploader :photo, PhotoUploader
  def name
    self.email.split('@')[0]
  end
end
