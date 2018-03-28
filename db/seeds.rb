# # # This file should contain all the record creation needed to seed the database with its default values.
# # # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# # #
# # # Examples:
Category.destroy_all
Category.create!(name: "Pilates")
Category.create!(name: "Cardio")
Category.create!(name: "Aerobic")
Category.create!(name: "Kids")
Category.create!(name: "Dance")
Category.create!(name: "Stretching")
Category.create!(name: "Boxing")
Category.create!(name: "Yoga")
Category.create!(name: "Strength Training")
Category.create!(name: "Martial Arts")
Category.create!(name: "Glutes")
Category.create!(name: "HIIT")
Category.create!(name: "legs")
Category.create!(name: "Conditioning")
Category.create!(name: "Crossfit")
Category.create!(name: "Resistance")
Category.create!(name: "Metabolism")

Listing.destroy_all

require 'csv'
csv_lists = File.read(Rails.root.join('lib', 'seeds', 'fitness.csv'))
csv_classes = File.read(Rails.root.join('lib', 'seeds', 'classes.csv'))

listings = CSV.parse(csv_lists.scrub, headers: true)
classes = CSV.parse(csv_classes.scrub, headers: true)
listings.each do |row|
  l = Listing.new
 l.name = row['Gym name']
 l.description = row['description']
 l.latitude = row['latitude']
 l.longitude = row['longitude']
 l.city = row['City']
 l.street = row['Street']
 l.landmark = row['Landmark']
 l.user = User.first
 l.owner = User.first
 l.save
  puts "#{l.name} saved"
end
Lesson.destroy_all
classes.each do |row|
  l = Lesson.new
  l.name = row['Class']
  l.start_time = row['Start time']
  l.end_time = row['End time']
  l.price = 15
  l.recurring = eval(row['rule'])
  list = Listing.where(name: row['gym'])
  l.listing = Listing.find_by_id(list.first.id)
  l.save
  categories = row['Categories']
  unless categories.nil?
     if categories.include?(',')
      cat = categories.split(',')
      cat.each do |category|
        category_data = Category.where(name: category.capitalize)
        # p category_data.first.id
        # p l.id
        unless category_data.nil?
          CategoryLesson.create!(category_id: category_data.first.id, lesson_id: l.id)
        end
      end
     else
      p category_data.first.id
      p l.id
      category_data = Category.where(name: categories.capitalize)
      CategoryLesson.create!(category_id: category_data.first.id, lesson_id: l.id)
     end
  end
  puts "#{l.name}, #{l.city} saved"
end
