# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all if Rails.env.development?
Review.destroy_all if Rails.env.development?
Car.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?

user1 = User.create(
  username: "Kristen Jonas",
  first_name: "Kristen",
  last_name: "Jonas",
  phone: "+12344",
  address: "Tokyo, Setagaya",
  drivers_license: "some license",
  email: "test@gmail.com",
  password: "123456"
  )

user2 = User.create(
  username: "Chuck Norris",
  first_name: "Chuck",
  last_name: "Norris",
  phone: "+12345",
  address: "Tokyo, Shibuya",
  drivers_license: "some other license",
  email: "chuck@gmail.com",
  password: "123456"
  )

user3 = User.create(
  username: "Jackie Chan",
  first_name: "Jackie",
  last_name: "Chan",
  phone: "+12346",
  address: "Tokyo, Roppongi",
  drivers_license: "some other license",
  email: "chuck@gmail.com",
  password: "123456"
  )

tania = User.create(
  username: "Tania Demi",
  first_name: "Tania",
  last_name: "Demi",
  phone: "+12346",
  address: "Peru, Lima",
  drivers_license: "some other license",
  email: "happykid@gmail.com",
  password: "123456"
  )

heroku = User.create(
  username: "Hiroku FU",
  first_name: "Hiroku",
  last_name: "FU",
  phone: "+12346",
  address: "China, Chengdu",
  drivers_license: "some other license",
  email: "hiroku@gmail.com",
  password: "123456"
  )

david = User.create(
  username: "David Li",
  first_name: "David",
  last_name: "Li",
  phone: "+12348",
  address: "China, Hongkong",
  drivers_license: "some other license",
  email: "David@gmail.com",
  password: "123456"
  )

jan = User.create(
  username: "Jan H",
  first_name: "Jan",
  last_name: "H",
  phone: "+12349",
  address: "Tokyo, Meguro",
  drivers_license: "some other license",
  email: "jan@gmail.com",
  password: "123456"
  )

p "created #{User.count} users"

brand = %w( Lamborgini Ferrari AstonMartin Bentley McLaren Porsche )
body_type = %w( Coupe Sedan SUV Wagon )
transmission = %w( manual automatic )


10.times do
  Car.create(
    brand: brand.sample,
    mileage: [*(1..50000)].sample,
    year: [1950, 1970, 1980, 1968, 2008, 2020].sample,
    body_type: body_type.sample,
    location: Faker::Nation.capital_city,
    price: [*(1000..5000)].sample,
    transmission: transmission.sample,
    user: User.all.sample,
    model: "fake model"

    )
end

p "created #{Car.count} cars"


10.times do
  Booking.create(
    car: Car.all.sample,
    user: User.all.sample,
    start_date: Date.new([1950, 1970, 1980, 1968, 2008, 2020].sample),
    end_date: Date.new([1950, 1970, 1980, 1968, 2008, 2020].sample)
    )
end

p "created #{Booking.count} bookings"

10.times do
  Review.create(
    content: Faker::Simpsons.quote,
    rating: [*(1..5)].sample,
    user: User.all.sample,
    car: Car.all.sample
    )
end

p "created #{Review.count} reviews"


p "finished!"


