require 'faker'
require "open-uri"

Booking.destroy_all
Car.destroy_all
User.destroy_all

p "---------destruction des 3 tables de la base----------"
francis = User.create!(email: "francis@email.com", password: "francis1234")
jordan = User.create!(email: "jordan@email.com", password: "jordan1234")
simon = User.create!(email: "simon@email.com", password: "simon1234", admin: true)

p "---------on créé 3 user jordan simon et francis----------"


  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/2/2c/2020_Aiways_U5_in_the_Netherlands.jpg")
  car = Car.create!(brand: "Aiways", model: "U5", color: "Grise",
            city: "6 Rue de la Metge, 81370 Saint-Sulpice-la-Pointe", kilometreage: Faker::Vehicle.kilometrage,
            price: 40, autonomy: 410, user: jordan)
  car.photo.attach(io: file, filename: "U5.jpg", content_type: "image/jpg")
  car.save

  file = URI.open("https://prod.pictures.autoscout24.net/listing-images/ea17bed8-4c52-4eff-b927-629152439036_8605aa9c-40f1-4aba-a272-9298c429e8b3.jpg/720x540.webp")
  car = Car.create!(brand: "Aston Martin", model: "Rapide E", color: "Grise",
            city: "9 Rue Jean Pascal, 31620 Labastide-Saint-Sernin", kilometreage: Faker::Vehicle.kilometrage,
            price: 99, autonomy: 200, user: simon)
  car.photo.attach(io: file, filename: "Rapide E.jpg", content_type: "image/jpg")
  car.save

  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Audi_e-tron_Sportback_IMG_4955.jpg/1280px-Audi_e-tron_Sportback_IMG_4955.jpg")
  car = Car.create!(brand: "Audi", model: "Q8 e-tron", color: "Blanche",
            city: "47 Rue Champfleuri, 63100 Clermont-Ferrand", kilometreage: Faker::Vehicle.kilometrage,
            price: 75, autonomy: 523, user: francis)
  car.photo.attach(io: file, filename: "Q8 e-tron.jpg", content_type: "image/jpg")
  car.save

  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/2/25/Audi_e-tron_Sportback_red.png")
  car = Car.create!(brand: "Audi", model: "Q8 e-tron Sportback", color: "Rouge",
            city: "45 Av. Marc Sangnier, 69100 Villeurbanne", kilometreage: Faker::Vehicle.kilometrage,
            price: 80, autonomy: 412, user: francis)
  car.photo.attach(io: file, filename: "Q8 e-tron sportback.jpg", content_type: "image/jpg")
  car.save

  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Baojun_E300_001.jpg/1024px-Baojun_E300_001.jpg")
  car = Car.create!(brand: "Baojun", model: "E300", color: "Blanche",
            city: "2 Rue le Val Sérine, 01410 Mijoux", kilometreage: Faker::Vehicle.kilometrage,
            price: 25, autonomy: 100, user: francis)
  car.photo.attach(io: file, filename: "E300.jpg", content_type: "image/jpg")
  car.save

  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/2018_BMW_i3_facelift_%281%29.jpg/1280px-2018_BMW_i3_facelift_%281%29.jpg")
  car = Car.create!(brand: "BMW", model: "i3", color: "Blanche",
            city: "18 Rue de l'Église, 25170 Lavernay", kilometreage: Faker::Vehicle.kilometrage,
            price: 25, autonomy: 120, user: francis)
  car.photo.attach(io: file, filename: "i3.jpg", content_type: "image/jpg")
  car.save

p "---------on créé 3 voitures pour chaque user----------"

Booking.create!(status: 'pending', start_date: "21/11/2022", end_date: "23/02/2023", car_id: simon.cars.sample.id, user_id: francis.id)
Booking.create!(status: 'pending', start_date: "12/12/2022", end_date: "20/03/2023", car_id: jordan.cars.sample.id, user_id: simon.id)
Booking.create!(status: 'accepted', start_date: "18/04/2023", end_date: "21/04/2023", car_id: jordan.cars.sample.id, user_id: francis.id)
p "---------finito pipo----------"
