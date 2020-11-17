# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all

User.create!(email: "admin@test", password: "password")
User.first.add_role(:admin)

user = User.create!(email: "user@test", password: "password")

Product.destroy_all
product1 = Product.new(name: "Donabe Smoker" , price: 200, user_id: user.id)
product1.image.attach(
    io: File.open(Rails.root.join("app", "assets", "images", "Donabesmoker.jpg")), 
    filename: 'Donabesmoker.jpg',
    content_type: "image/jpg"
)
product1.save

product2 = Product.new!(name: "Donabe Multipurpose" , price: 250, user_id: user.id)
product2.image.attach(
    io: File.open(Rails.root.join("app", "assets", "images", "DonabeMultipurpose.jpg")), 
    filename: 'Donabesmoker.jpg',
    content_type: "image/jpg"
)
product2.save

product3 = Product.create!(name: "Donabe Mustard" , price: 130, user_id: user.id)
product3.image.attach(
    io: File.open(Rails.root.join("app", "assets", "images", "Donabemustard.jpg")), 
    filename: 'Donabesmoker.jpg',
    content_type: "image/jpg"
)
product3.save

puts "users created: #{User.count}"
puts "products created: #{Product.count}"

