puts "Cleaning the DB..."
User.destroy_all
random = (1..20).to_a.shuffle
# path for local images. assets/images/vehicles/-->hash_keys
images = { Bosozoku_Bike: (1..3).to_a, Decotora: (1..5).to_a, Itasha: (1..6).to_a }

puts "Creating host users..."
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "#{random.pop}@email.com",
    password: 123123,
  )
end
puts "...created #{User.count} host users."

puts "Creating vehicles with images..."
images.each do |category, file_names|
  file_names.each do |file_name|
    puts "..."
    vehicle = Vehicle.create!(
      user: User.all.sample,
      brand: Faker::Vehicle.make,
      model: Faker::Vehicle.model,
      category: category,
      location: Faker::Address.city,
      price: rand(5000..30000),
      description: Faker::Vehicle.standard_specs.join(', ')
    )
    file = File.open("app/assets/images/vehicles/#{category}/#{file_name}.jpeg")
    vehicle.photo.attach(io: file, filename: 'vehicle.jpeg', content_type: 'image/jpeg')
  end
end
puts "...created #{Vehicle.count} vehicles."

# 10.times do
#   vehicle = Vehicle.create!(
#     user: User.all.sample,
#     brand: Faker::Vehicle.make,
#     model: Faker::Vehicle.model,
#     category: Vehicle::CATEGORIES.sample,
#     location: Faker::Address.city,
#     price: rand(5000..10000),
#     description: Faker::Vehicle.standard_specs.join(', ')
#   )
#   file = File.open("app/assets/images/vehicles/itasha/p52-1.jpeg")
#   vehicle.photo.attach(io: file, filename: 'vehicle.jpeg', content_type: 'image/jpeg')
# end

puts "Creating guest users..."
10.times do
  User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: "#{random.pop}@email.com",
  password: 123123,
)
end
puts "...created #{User.count} users."

puts "Creating bookings..."
30.times do
  Booking.create!(
    vehicle: Vehicle.all.sample,
    user: User.all.sample,
    start_date: Date.today,
    return_date: Date.tomorrow
  )
end
puts "...created #{Booking.count} bookings."
