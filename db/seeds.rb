# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: 'ahmad.msouti@hotmail.com', password: 'ahmad.93', password_confirmation: 'ahmad.93', admin: true)
Category.destroy_all
category1 = Category.create!(name: 'Seasonal')
category2 = Category.create!(name: 'Fitness')
category3 = Category.create!(name: 'Leisure')
category4 = Category.create!(name: 'Stores')
category5 = Category.create!(name: 'Wellbeing')
category6 = Category.create!(name: 'Group')
Service.destroy_all
service1 = Service.create!(name: 'Football')
service2 = Service.create!(name: 'Basketball')
service3 = Service.create!(name: 'Golf')
service4 = Service.create!(name: 'Swimming')
service5 = Service.create!(name: 'Yoga')
service6 = Service.create!(name: 'Volleyball')
service7 = Service.create!(name: 'Rugby')
service8 = Service.create!(name: 'Water Polo')
service9 = Service.create!(name: 'Squash')
service10 = Service.create!(name: 'Tennis')
service11 = Service.create!(name: 'Running')
service12 = Service.create!(name: 'Horse back riding')
service13 = Service.create!(name: 'Dancing')
service14 = Service.create!(name: 'Meditation')
Tag.destroy_all
tag1 = Tag.create!(name: 'Towels')
tag2 = Tag.create!(name: 'Outdoors')
tag3 = Tag.create!(name: 'Indoors')
tag4 = Tag.create!(name: 'Wifi')
tag5 = Tag.create!(name: 'Showers')
tag6 = Tag.create!(name: 'Showers')
Listing.destroy_all
puts 'Creating listings...'
array = [category1.id, category2.id, category3.id, category4.id, category5.id, category6.id]
array2 = [service1.id, service2.id, service3.id, service4.id, service5.id, service6.id, service7.id, service8.id, service9.id, service10.id, service11.id, service12.id, service13.id, service14.id]
array3 = [tag1.id, tag2.id, tag3.id, tag4.id, tag5.id, tag6.id]

100.times do
  Listing.create!(
    name: Faker::Company.name,
    description: Faker::Company.catch_phrase,
    status: [1,2].sample,
    user_id: 1,
    city: Faker::Address.city,
    street: Faker::Address.street_name,
    landmark: Faker::Address.country,
    phonenumber: Faker::PhoneNumber.cell_phone,
    longtitude: Faker::Address.longitude,
    latitude: Faker::Address.latitude,
    category_ids: array.sample(3),
    service_ids: array2.sample(6),
    tag_ids: array3.sample(3)
  )
end
puts 'Finished!'




