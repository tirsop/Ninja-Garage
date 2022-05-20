puts "Cleaning the DB..."
Review.destroy_all
User.destroy_all
random = (1..20).to_a.shuffle
# path for local images. assets/images/vehicles/-->hash_keys
images = { Bosozoku_Bike: (1..10).to_a, Decotora: (1..6).to_a, Itasha: (1..9).to_a }

puts "Creating host users..."
User.create!(
  first_name: "Yuki",
  last_name: "Harwood",
  email: "yuki@email.com",
  password: 123_123
)
vehicle = Vehicle.create!(
  user: User.find_by(first_name: "Yuki"),
  brand: Faker::Vehicle.make,
  model: Faker::Vehicle.model,
  category: "Itasha",
  location: 'Yokohama',
  price: rand(5000..30_000),
  description: Faker::Vehicle.standard_specs.join(', ')
)
file = File.open("app/assets/images/vehicles/Itasha/yuki.jpeg")
vehicle.photo.attach(io: file, filename: 'vehicle.jpeg', content_type: 'image/jpeg')

10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "#{random.pop}@email.com",
    password: 123_123,
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
      location: %w[Shibuya Meguro Mizonokuchi Ueno Koenji Kawasaki Kyoto Gumma Tochigi Nagano Fukuoka Kagoshima Kumamoto Amagasaki].sample,
      price: rand(5000..30_000),
      description: Faker::Vehicle.standard_specs.join(', ')
    )
    file = File.open("app/assets/images/vehicles/#{category}/#{file_name}.jpeg")
    vehicle.photo.attach(io: file, filename: 'vehicle.jpeg', content_type: 'image/jpeg')
  end
end
puts "...created #{Vehicle.count} vehicles."

puts "Creating guest users..."
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "#{random.pop}@email.com",
    password: 123_123
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

# Users can not book their own car. It gets confusing.
Booking.all.each do |booking|
  booking.destroy if booking.user == booking.vehicle.user
end

puts "...created #{Booking.count} bookings."

puts "Creating reviews..."
30.times do
  Review.create!(
    rating: rand(1..5),
    content: Faker::Quote.matz,
    user: User.all.sample,
    vehicle: Vehicle.all.sample
  )
end
puts "...created #{Review.count} reviews."
