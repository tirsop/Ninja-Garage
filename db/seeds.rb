# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning the DB..."
Booking.destroy_all
User.destroy_all
random = (1..20).to_a.shuffle

10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "#{random.pop}@email.com",
    password: 123123,
  )
end
puts "...created #{User.count} host users."

10.times do
Vehicle.create!(
  user: User.all.sample,
  brand: Faker::Vehicle.make,
  model: Faker::Vehicle.model,
  category: Vehicle::CATEGORIES.sample,
  location: Faker::Address.city,
  price: rand(5000..10000),
  description: Faker::Vehicle.standard_specs
)
end
puts "Created #{Vehicle.count} vehicles."
puts "Creating users..."
10.times do
  User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: "#{random.pop}@email.com",
  password: 123123,
)
end
puts "...created #{User.count} users."
30.times do
Booking.create!(
  vehicle: Vehicle.all.sample,
  user: User.all.sample,
  start_date: Date.today,
  return_date: Date.tomorrow
)
end
puts "...created #{Booking.count} bookings."
