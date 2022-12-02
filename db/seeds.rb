require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning date base"

Spaceship.destroy_all
User.destroy_all

puts "Creating Users..."
20.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save
  puts "User save"
  puts "Creating spaceship"
  5.times do
    spaceship = Spaceship.new(
      user_id: user.id,
      name: Faker::Movies::StarWars.vehicle,
      description: Faker::Lorem.paragraph(sentence_count: 2),
      max_people: Faker::Number.between(from: 1, to: 10),
      price: Faker::Commerce.price
    )
    spaceship.save
  end
end

puts "Finished"
