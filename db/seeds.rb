# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.destroy_all if Rails.env.development?
Booking.destroy_all if Rails.env.development?
Car.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?

url1 = "https://res.cloudinary.com/jphoga/image/upload/v1534234316/face.jpg"
url2 = "https://res.cloudinary.com/jphoga/image/upload/v1534234315/chuck.jpg"
url3 = "https://res.cloudinary.com/jphoga/image/upload/v1534234316/jackiechan.jpg"
url4 = "https://res.cloudinary.com/jphoga/image/upload/v1534234316/tania.png"
url5 = "https://res.cloudinary.com/jphoga/image/upload/v1534234316/hiroki.png"
url6 = "https://res.cloudinary.com/jphoga/image/upload/v1534234316/david.png"
url7 = "https://res.cloudinary.com/jphoga/image/upload/v1533875438/Foto1.jpg"


user1 = User.create(
  username: "Kristen Jonas",
  first_name: "Kristen",
  last_name: "Jonas",
  phone: "+12344",
  address: "Tokyo, Setagaya",
  drivers_license: "some license",
  email: "test@gmail.com",
  password: "123456",
  remote_photo_url: url1
  )

user2 = User.create(
  username: "Chuck Norris",
  first_name: "Chuck",
  last_name: "Norris",
  phone: "+12345",
  address: "Tokyo, Shibuya",
  drivers_license: "some other license",
  email: "chuck@gmail.com",
  password: "123456",
  remote_photo_url: url2
  )


user3 = User.create(
  username: "Jackie Chan",
  first_name: "Jackie",
  last_name: "Chan",
  phone: "+12346",
  address: "Tokyo, Roppongi",
  drivers_license: "some other license",
  email: "jackiechan@gmail.com",
  password: "123456",
  remote_photo_url: url3
  )

tania = User.create(
  username: "Tania Demi",
  first_name: "Tania",
  last_name: "Demi",
  phone: "+12346",
  address: "Peru, Lima",
  drivers_license: "some other license",
  email: "happykid@gmail.com",
  password: "123456",
  remote_photo_url: url4
  )


heroku = User.create(
  username: "Hiroku FU",
  first_name: "Hiroku",
  last_name: "FU",
  phone: "+12346",
  address: "China, Chengdu",
  drivers_license: "some other license",
  email: "hiroku@gmail.com",
  password: "123456",
  remote_photo_url: url5

  )


david = User.create(
  username: "David Li",
  first_name: "David",
  last_name: "Li",
  phone: "+12348",
  address: "China, Hongkong",
  drivers_license: "some other license",
  email: "David@gmail.com",
  password: "123456",
  remote_photo_url: url6
  )


jan = User.create(
  username: "Jan H",
  first_name: "Jan",
  last_name: "H",
  phone: "+12349",
  address: "Tokyo, Meguro",
  drivers_license: "some other license",
  email: "jan@gmail.com",
  password: "123456",
  remote_photo_url: url7
  )



p "created #{User.count} users"

brand = %w( Lamborgini Ferrari Bentley McLaren Porsche )
body_type = %w( Coupe Sedan SUV Wagon )
transmission = %w( manual automatic )

porscheurl = "https://res.cloudinary.com/jphoga/image/upload/v1534234624/porsche.jpg"
astonurl = "https://res.cloudinary.com/jphoga/image/upload/v1534234623/aston.jpg"
mclarenurl = "https://res.cloudinary.com/jphoga/image/upload/v1534234316/mclaren.jpg"
bentelyurl = "https://res.cloudinary.com/jphoga/image/upload/v1534234316/bentely.jpg"
ferrariurl = "https://res.cloudinary.com/jphoga/image/upload/v1534234316/ferrari.jpg"
lamborginiurl = "https://res.cloudinary.com/jphoga/image/upload/v1534234316/centenario.jpg"


  porsche = Car.create(
    brand: "Porsche",
    mileage: [*(10..50000)].sample,
    year: 2008,
    body_type: "Coupe",
    location: "Tokyo",
    price: [*(1000..5000)].sample,
    transmission: transmission.sample,
    user: User.all.sample,
    model: "911",
    remote_photo_url: porscheurl
    )

  lamborgini = Car.create(
    brand: "Lamborgini",
    mileage: [*(100..50000)].sample,
    year: 2010,
    body_type: "Coupe",
    location: "Tokyo",
    price: [*(1000..5000)].sample,
    transmission: transmission.sample,
    user: User.all.sample,
    model: "Gallardo",
    remote_photo_url: lamborginiurl
    )

  ferrari = Car.create(
    brand: "Ferrari",
    mileage: [*(1..50000)].sample,
    year: 2010,
    body_type: "Coupe",
    location: "Lima",
    price: [*(1000..5000)].sample,
    transmission: transmission.sample,
    user: User.all.sample,
    model: "458 Italia",
    remote_photo_url: ferrariurl
    )

  bentely = Car.create(
    brand: "Bentley",
    mileage: [*(1..50000)].sample,
    year: 2015,
    body_type: "Coupe",
    location: "Paris",
    price: [*(1000..5000)].sample,
    transmission: transmission.sample,
    user: User.all.sample,
    model: "Continental GT",
    remote_photo_url: bentelyurl
    )

  mclaren = Car.create(
    brand: "McLaren",
    mileage: [*(1..50000)].sample,
    year: 2018,
    body_type: "Coupe",
    location: "New York",
    price: [*(1000..5000)].sample,
    transmission: transmission.sample,
    user: User.all.sample,
    model: "750 S",
    remote_photo_url: mclarenurl
    )

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

100.times do
  Review.create(
    content: Faker::Simpsons.quote,
    rating: [*(1..5)].sample,
    user: User.all.sample,
    booking: Booking.all.sample
    )
end

p "created #{Review.count} reviews"


p "finished!"


