# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning the DB..."
User.destroy_all

puts "Creating users..."
10.times do
  User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  emails: "#{rand(11..20)}@email.com",
  password: 123123
  )
end
puts "...created #{User.count} guest users."

10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    emails: "#{rand(1..10)}@email.com",
    password: 123123,
    vehicle: Vehicle.create!(
      brand: Faker::Vehicle.make,
      model: Faker::Vehicle.model,
      category: Vehicle::CATEGORIES.sample,
      location: Faker::Address.city,
      price: rand(5000..10000),
      description: Faker::Vehicle.standard_specs
    )
  )
end
puts "...created #{User.count} users."
