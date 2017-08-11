json.extract! lesson, :id, :name, :description, :city, :street, :landmark, :phonenumber, :longtitude, :latitude, :user_id, :listing_id, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
