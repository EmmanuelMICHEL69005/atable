require 'faker'
Restaurant.destroy_all
User.destroy_all
Customer.destroy_all
Booking.destroy_all



restaurant = Restaurant.create!(name: "Hello")

10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: 'azerty',
    restaurant: restaurant,
    )
end

15.times do
  customer = Customer.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: rand(1000000000),
    email: Faker::Internet.email,
    )

  rand(5).times do
    booking = Booking.create!(
      date: Date.new,
      number_of_customers: (4..10).to_a.sample,
      restaurant: restaurant,
      customer: customer
    )
  end
end








# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
