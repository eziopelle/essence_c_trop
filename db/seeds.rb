require 'faker'
require "open-uri"

Booking.destroy_all
Car.destroy_all
User.destroy_all
Review.destroy_all

p "---------destruction des 3 tables de la base----------"
francis = User.create!(email: "francis@email.com", password: "francis1234")
jordan = User.create!(email: "jordan@email.com", password: "jordan1234")
simon = User.create!(email: "simon@email.com", password: "simon1234", admin: true)

p "---------on créé 3 user jordan simon et francis----------"


  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/2/2c/2020_Aiways_U5_in_the_Netherlands.jpg")
  car = Car.create!(brand: "Aiways", model: "U5", color: "Gris",
            city: "6 Rue de la Metge, 81370 Saint-Sulpice-la-Pointe", kilometreage: Faker::Vehicle.kilometrage,
            price: 40, autonomy: 410, user: jordan)
  car.photo.attach(io: file, filename: "U5.jpg", content_type: "image/jpg")
  car.save

  6.times do
    Review.create!(content: Faker::Restaurant.review, rating: [1, 2, 3, 4, 5].sample, car_id: car.id, title: "J'ai bien aimé cette caisse", user_id: francis.id)
  end

  file = URI.open("https://prod.pictures.autoscout24.net/listing-images/ea17bed8-4c52-4eff-b927-629152439036_8605aa9c-40f1-4aba-a272-9298c429e8b3.jpg/720x540.webp")
  car = Car.create!(brand: "Aston Martin", model: "Rapide E", color: "Gris",
            city: "9 Rue Jean Pascal, 31620 Labastide-Saint-Sernin", kilometreage: Faker::Vehicle.kilometrage,
            price: 99, autonomy: 200, user: simon)
  car.photo.attach(io: file, filename: "Rapide E.jpg", content_type: "image/jpg")
  car.save

  6.times do
    Review.create!(content: Faker::Restaurant.review, rating: [1, 2, 3, 4, 5].sample, car_id: car.id, title: "J'ai bien aimé cette caisse", user_id: simon.id)
  end

  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Audi_e-tron_Sportback_IMG_4955.jpg/1280px-Audi_e-tron_Sportback_IMG_4955.jpg")
  car = Car.create!(brand: "Audi", model: "Q8 e-tron", color: "Blanc",
            city: "47 Rue Champfleuri, 63100 Clermont-Ferrand", kilometreage: Faker::Vehicle.kilometrage,
            price: 75, autonomy: 523, user: francis)
  car.photo.attach(io: file, filename: "Q8 e-tron.jpg", content_type: "image/jpg")
  car.save

  6.times do
    Review.create!(content: Faker::Restaurant.review, rating: [1, 2, 3, 4, 5].sample, car_id: car.id, title: "J'ai bien aimé cette caisse", user_id: simon.id)
  end

  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/2/25/Audi_e-tron_Sportback_red.png")
  car = Car.create!(brand: "Audi", model: "Q8 e-tron Sportback", color: "Rouge",
            city: "45 Av. Marc Sangnier, 69100 Villeurbanne", kilometreage: Faker::Vehicle.kilometrage,
            price: 80, autonomy: 412, user: francis)
  car.photo.attach(io: file, filename: "Q8 e-tron sportback.jpg", content_type: "image/jpg")
  car.save

  6.times do
    Review.create!(content: Faker::Restaurant.review, rating: [1, 2, 3, 4, 5].sample, car_id: car.id, title: "J'ai bien aimé cette caisse", user_id: francis.id)
  end

  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Baojun_E300_001.jpg/1024px-Baojun_E300_001.jpg")
  car = Car.create!(brand: "Baojun", model: "E300", color: "Blanc",
            city: "2 Rue le Val Sérine, 01410 Mijoux", kilometreage: Faker::Vehicle.kilometrage,
            price: 25, autonomy: 100, user: francis)
  car.photo.attach(io: file, filename: "E300.jpg", content_type: "image/jpg")
  car.save

  6.times do
    Review.create!(content: Faker::Restaurant.review, rating: [1, 2, 3, 4, 5].sample, car_id: car.id, title: "J'ai bien aimé cette caisse", user_id: simon.id)
  end

  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/2018_BMW_i3_facelift_%281%29.jpg/1280px-2018_BMW_i3_facelift_%281%29.jpg")
  car = Car.create!(brand: "BMW", model: "i3", color: "Blanc",
            city: "18 Rue de l'Église, 25170 Lavernay", kilometreage: Faker::Vehicle.kilometrage,
            price: 25, autonomy: 120, user: francis)
  car.photo.attach(io: file, filename: "i3.jpg", content_type: "image/jpg")
  car.save

  6.times do
    Review.create!(content: Faker::Restaurant.review, rating: [1, 2, 3, 4, 5].sample, car_id: car.id, title: "J'ai bien aimé cette caisse", user_id: francis.id)
  end

  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/2017_Chevrolet_Bolt_EV_Premier_front_6.20.18.jpg/1280px-2017_Chevrolet_Bolt_EV_Premier_front_6.20.18.jpg")
  car = Car.create!(brand: "Chevrolet", model: "Bolt EV", color: "Gris foncé",
            city: "8 Rue Coupé d'Or, 54470 Thiaucourt-Regniéville", kilometreage: Faker::Vehicle.kilometrage,
            price: 25, autonomy: 150, user: francis)
  car.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
  car.save

  6.times do
    Review.create!(content: Faker::Restaurant.review, rating: [1, 2, 3, 4, 5].sample, car_id: car.id, title: "J'ai bien aimé cette caisse", user_id: francis.id)
  end

  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Cupra_Born_IAA_2021_1X7A0212.jpg/1920px-Cupra_Born_IAA_2021_1X7A0212.jpg")
  car = Car.create!(brand: "Cupra", model: "Born", color: "Gris",
            city: "35 Rue Delaroche, 62100 Calais", kilometreage: Faker::Vehicle.kilometrage,
            price: 50, autonomy: 215, user: francis)
  car.photo.attach(io: file, filename: "Born.jpg", content_type: "image/jpg")
  car.save

  6.times do
    Review.create!(content: Faker::Restaurant.review, rating: [1, 2, 3, 4, 5].sample, car_id: car.id, title: "J'ai bien aimé cette caisse", user_id: simon.id)
  end

  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Citroen-e-Mehari-av-Belle-Ile-en-Mer-byRundvald.jpg/1024px-Citroen-e-Mehari-av-Belle-Ile-en-Mer-byRundvald.jpg")
  car = Car.create!(brand: "Citroën", model: "e-Méhari", color: "Vert anis",
            city: "2 Rue de Crimée, 76130 Mont-Saint-Aignan", kilometreage: Faker::Vehicle.kilometrage,
            price: 48, autonomy: 195, user: francis)
  car.photo.attach(io: file, filename: "e-mehari.jpg", content_type: "image/jpg")
  car.save

  6.times do
    Review.create!(content: Faker::Restaurant.review, rating: [1, 2, 3, 4, 5].sample, car_id: car.id, title: "J'ai bien aimé cette caisse", user_id: francis.id)
  end

  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Fiat-500-vorne2.jpg/1024px-Fiat-500-vorne2.jpg")
  car = Car.create!(brand: "Fiat", model: "500e", color: "Bleu marine",
            city: "107 Rue de Ménilmontant, 75020 Paris", kilometreage: Faker::Vehicle.kilometrage,
            price: 65, autonomy: 320, user: francis)
  car.photo.attach(io: file, filename: "fiat-500E.jpg", content_type: "image/jpg")
  car.save

  6.times do
    Review.create!(content: Faker::Restaurant.review, rating: [1, 2, 3, 4, 5].sample, car_id: car.id, title: "J'ai bien aimé cette caisse", user_id: francis.id)
  end

  file = URI.open("https://images.caradisiac.com/images/6/4/5/7/196457/S1-essai-mustang-mach-e-716946.jpg")
  car = Car.create!(brand: "Ford", model: "Mustang Mach-E", color: "Blanc",
            city: "5 Rue de l'Ancien Porche, 35690 Acigné", kilometreage: Faker::Vehicle.kilometrage,
            price: 95, autonomy: 490, user: francis)
  car.photo.attach(io: file, filename: "mustang.jpg", content_type: "image/jpg")
  car.save

  6.times do
    Review.create!(content: Faker::Restaurant.review, rating: [1, 2, 3, 4, 5].sample, car_id: car.id, title: "J'ai bien aimé cette caisse", user_id: francis.id)
  end

  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Lexus_UX_250h_IMG_0385.jpg/1280px-Lexus_UX_250h_IMG_0385.jpg")
  car = Car.create!(brand: "Lexus", model: "UX", color: "Gris",
            city: "10 Rue Marguerite Allar, 13013 Marseille", kilometreage: Faker::Vehicle.kilometrage,
            price: 60, autonomy: 315, user: francis)
  car.photo.attach(io: file, filename: "lexus-ux.jpg", content_type: "image/jpg")
  car.save

  6.times do
    Review.create!(content: Faker::Restaurant.review, rating: [1, 2, 3, 4, 5].sample, car_id: car.id, title: "J'ai bien aimé cette caisse", user_id: jordan.id)
  end

  file = URI.open("https://img.phonandroid.com/2022/04/Mercedes-EQB-5-665x575.jpg")
  car = Car.create!(brand: "Mercedes-Benz", model: "EQB", color: "Gris foncé",
            city: "5 Cr Carbonnet, 59000 Lille", kilometreage: Faker::Vehicle.kilometrage,
            price: 89, autonomy: 440, user: francis)
  car.photo.attach(io: file, filename: "EQB.jpg", content_type: "image/jpg")
  car.save

  6.times do
    Review.create!(content: Faker::Restaurant.review, rating: [1, 2, 3, 4, 5].sample, car_id: car.id, title: "J'ai bien aimé cette caisse", user_id: jordan.id)
  end

  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/5/51/Renault_Zoe_charging.jpg")
  car = Car.create!(brand: "Renault", model: "Zoé", color: "Blanche",
            city: "12 Imp. Camille Pelletan, 18000 Bourges", kilometreage: Faker::Vehicle.kilometrage,
            price: 30, autonomy: 290, user: francis)
  car.photo.attach(io: file, filename: "zoe.jpg", content_type: "image/jpg")
  car.save

  6.times do
    Review.create!(content: Faker::Restaurant.review, rating: [1, 2, 3, 4, 5].sample, car_id: car.id, title: "J'ai bien aimé cette caisse", user_id: jordan.id)
  end
p "---------on créé 3 voitures pour chaque user----------"

Booking.create!(status: 'pending', start_date: "21/11/2022", end_date: "23/02/2023", car_id: simon.cars.sample.id, user_id: francis.id)
Booking.create!(status: 'pending', start_date: "12/12/2022", end_date: "20/03/2023", car_id: jordan.cars.sample.id, user_id: simon.id)
Booking.create!(status: 'accepted', start_date: "18/04/2023", end_date: "21/04/2023", car_id: jordan.cars.sample.id, user_id: francis.id)
p "---------finito pipo----------"

6.times do
  Review.create!(content: Faker::Restaurant.review, rating: [1, 2, 3, 4, 5].sample, car_id: car.id, title: "J'ai bien aimé cette caisse", user_id: francis.id)
end
