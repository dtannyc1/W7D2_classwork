# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "Destroying Tables..."
User.destroy_all
Band.destroy_all

puts "Reseeding Tables..."
User.create(email: (Faker::Books::Lovecraft.word + '@gmail.com'), password: "password")

10.times do
    Band.create(name: Faker::Music.band)
end
puts "Success!"
