# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"

Booking.destroy_all
Car.destroy_all
User.destroy_all

p "---------destruction des 3 tables de la base----------"
francis = User.create!(email: "francis@email.com", password: "francis1234")
jordan = User.create!(email: "jordan@email.com", password: "jordan1234")
simon = User.create!(email: "simon@email.com", password: "simon1234", admin: true)
p "---------on créer 3 user jordan simon et francis----------"


[francis, simon, jordan].each do |user|
  3.times do
    file = URI.open("https://img.freepik.com/photos-gratuite/couleur-argent-mini-coupe-route-conduisez-sous-soleil_114579-5050.jpg?w=2000")
    car = Car.create!(brand: Faker::Vehicle.manufacture, model: Faker::Vehicle.model, color: Faker::Vehicle.color,
              city: Faker::Address.city, kilometreage: Faker::Vehicle.kilometrage,
              price: [50, 100, 150, 200, 400, 700, 1000].sample, autonomy: [200, 350, 500, 575, 700, 800].sample, user: user)
    car.photo.attach(io: file, filename: "voitures.jpg", content_type: "image/jpg")
    car.save
  end
end
p "---------on creer 3 voitures pour chaque user----------"

Booking.create!(status: 'pending', start_date: "21/11/2022", end_date: "23/02/2023", car: simon.cars.sample, user: francis)
Booking.create!(status: 'pending', start_date: "12/12/2022", end_date: "20/03/2023", car: jordan.cars.sample, user: simon)
Booking.create!(status: 'accepted', start_date: "18/04/2023", end_date: "21/04/2023", car: jordan.cars.sample, user: francis)
p "---------done----------"
