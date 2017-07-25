json.extract! listing, :id, :name, :description, :status, :owner_id, :user_id, :city, :street, :landmark, :phonenumber, :longtitude, :latitude, :created_at, :updated_at
json.url listing_url(listing, format: :json)
