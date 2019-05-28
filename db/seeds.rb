require 'faker'
Restaurant.destroy_all
User.destroy_all
Customer.destroy_all
Booking.destroy_all


10.times do
restaurant = Restaurant.create!(name: Faker::Restaurant.name, address: Faker::Address.street_address, zipcode: Faker::Address.zip_code, city: Faker::Address.city, capacity: (20..50).to_a.sample  )

  rand(5).times do
    user = User.create!(
      email: Faker::Internet.email,
      password: 'azerty',
      restaurant: restaurant,
      )
  end

  rand(5).times do
    customer = Customer.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      phone_number: rand(1000000000),
      email: Faker::Internet.email,
      )

    rand(5).times do
      booking = Booking.create!(
        date: Faker::Date.forward(23),
        number_of_customers: (4..10).to_a.sample,
        restaurant: restaurant,
        customer: Customer.all.sample,
        hour: ['11h30', '12h00', '12h30', '13h00', '13h30', '14h00'].sample,
        content: ['Table ronde', 'Terrasse', 'Vue mer','Discretion assurée',''].sample,
        status: ['Pending', 'Valided', 'Canceled'].sample,
      )
    end
  end
end

    user = User.create!(
      email: 'test@atable.live',
      password: 'azerty',
      restaurant: Restaurant.last
      )
  rand(5).times do
      booking = Booking.create!(
        date: Faker::Date.forward(23),
        number_of_customers: (4..10).to_a.sample,
        restaurant: Restaurant.last,
        customer: Customer.all.sample,
        hour: ['11h30', '12h00', '12h30', '13h00', '13h30', '14h00'].sample,
        content: ['Table ronde', 'Terrasse', 'Vue mer','Discretion assurée',''].sample,
        status: ['Pending', 'Valided', 'Canceled'].sample,
      )
  end




# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
