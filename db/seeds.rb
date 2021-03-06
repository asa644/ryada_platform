# # # This file should contain all the record creation needed to seed the database with its default values.
# # # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# # #
# # # Examples:
# Category.destroy_all
# Category.create!(name: "Pilates")
# Category.create!(name: "Cardio")
# # Category.create!(name: "Aerobic")
# Category.create!(name: "women only")
# Category.create!(name: "Dance")
# Category.create!(name: "Stretching")
# # Category.create!(name: "Boxing")
# Category.create!(name: "Yoga")
# Category.create!(name: "Strength training")
# Category.create!(name: "Martial arts")
# Category.create!(name: "Glutes")
# # Category.create!(name: "HIIT")
# Category.create!(name: "Legs")
# Category.create!(name: "Conditioning")
# Category.create!(name: "Crossfit")
# Category.create!(name: "Resistance")
# Category.create!(name: "Prenatal")
# Category.create!(name: "Metabolism")
# Category.create!(name: "Core")
# Category.create!(name: "Body toning")
# Category.create!(name: "Functional")
# Category.create!(name: "Gymnastics")


# Listing.destroy_all
require 'csv'
csv_lists = File.read(Rails.root.join('lib', 'seeds', 'studios_3.csv'))
csv_classes = File.read(Rails.root.join('lib', 'seeds', 'classes_4.csv'))
listings = CSV.parse(csv_lists.scrub, headers: true)
classes = CSV.parse(csv_classes.scrub, headers: true)
listings.each do |row|
 l = Listing.new
 l.name = row['Gym name']
 l.latitude = row['latitude']
 l.longitude = row['longitude']
 l.city = row['City']
 l.street = row['Street']
 l.landmark = row['Landmark']
 l.user = User.first
 l.owner = User.first
 l.save
end
# Lesson.create!(name:Vinyasa, start_time: 10:00 end_time: 11:30 Yoga  IceCube::Rule.weekly(1).day(0)  AK Yoga Studio  20  All levels  Vinyasa Yoga focuses on synchronizing every movement with a breath. Vinyasa not only condition the body, but it also works on improving temperment, discipline and mental focus. This class is suited to those with some yoga experience
# Lesson.destroy_all
classes.each do |row|
  l = Lesson.new
  l.name = row['Class']
  l.start_time = row['Start time']
  l.end_time = row['End time']
  l.price = row['price']
  l.description = row['description']
  l.recurring = eval(row['rule'])
  list = Listing.where(name: row['gym'])
  l.listing = Listing.find_by_id(list.first.id)
  l.save
  categories = row['Categories']
   if categories.include?(',')
    cat = categories.split(',')
    cat.each do |category|
      if category == "HIIT"
        category_data = Category.where(name: category)
      else
        category_data = Category.where(name: category.capitalize)
      end
      # p l.name
      # p l.start_time
      # p category_data
      # p category_data.first.name
      unless category_data.nil?
        CategoryLesson.create!(category_id: category_data.first.id, lesson_id: l.id)
      end
    end
   else
    category = Category.where(name: categories.capitalize)
      unless category.nil?
        CategoryLesson.create!(category_id: category.first.id, lesson_id: l.id)
      end
   end
end
