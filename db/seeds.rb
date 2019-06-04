require 'faker'
Restaurant.destroy_all
User.destroy_all
Customer.destroy_all
Booking.destroy_all


# REEL DATA

restaurant = Restaurant.create!(name: Faker::Restaurant.name, address: Faker::Address.street_address, zipcode: Faker::Address.zip_code, city: Faker::Address.city, capacity: (20..50).to_a.sample  )

kevin = Customer.create!(
  first_name: "kevin",
  last_name: "Chavanne",
  phone_number: "0675342561",
  email: "kevin.chavanne@gmail.com",
  )

kevin_booking1 = Booking.create!(
  date: Date.today,
  number_of_customers: 7,
  restaurant: restaurant,
  customer: kevin,
  hour: '12h30',
  content: 'Terrasse',
  status: 'Valided'
)

mathieu = Customer.create!(
  first_name: "mathieu",
  last_name: "cartilier",
  phone_number: "0675342561",
  email: "mathieu.cartilier@gmail.com",
  )

mathieu_booking1 = Booking.create!(
  date: Date.today,
  number_of_customers: 7,
  restaurant: restaurant,
  customer: mathieu,
  hour: '19h30',
  content: 'Terrasse',
  status: 'Valided'
)

joseph = Customer.create!(
  first_name: "joseph",
  last_name: "blanchard",
  phone_number: "0675342561",
  email: "joseph.blanchard@gmail.com",
  )

joseph_booking1 = Booking.create!(
  date: Date.today,
  number_of_customers: 7,
  restaurant: restaurant,
  customer: joseph,
  hour: '20h30',
  content: 'une table Cool',
  status: 'Valided'
)

boris = Customer.create!(
  first_name: "boris",
  last_name: "leboss",
  phone_number: "0675342561",
  email: "boris.leboss@gmail.com",
  )

boris_booking1 = Booking.create!(
  date: Date.today,
  number_of_customers: 2,
  restaurant: restaurant,
  customer: boris,
  hour: '13h30',
  content: 'Terrasse',
  status: 'Valided'
)

gerard = Customer.create!(
  first_name: "gerard",
  last_name: "cuillere",
  phone_number: "0675342561",
  email: "gerard.cartilier@gmail.com",
  )

gerard_booking1 = Booking.create!(
  date: Date.today,
  number_of_customers: 3,
  restaurant: restaurant,
  customer: gerard,
  hour: '13hOO',
  content: 'Terrasse',
  status: 'Valided'
)

maxime = Customer.create!(
  first_name: "maxime",
  last_name: "narco",
  phone_number: "0675342561",
  email: "maxime.narcoleptique@gmail.com",
  )

maxime_booking1 = Booking.create!(
  date: Date.today,
  number_of_customers: 4,
  restaurant: restaurant,
  customer: maxime,
  hour: '19h00',
  content: 'un canapé svp',
  status: 'Valided'
)
alex = Customer.create!(
  first_name: "alex",
  last_name: "durand",
  phone_number: "0675342561",
  email: "alex.durand@gmail.com",
  )

alex_booking1 = Booking.create!(
  date: Date.today,
  number_of_customers: 8,
  restaurant: restaurant,
  customer: alex,
  hour: '20h30',
  status: 'Valided'
)

# FAKE DATA

  rand(5).times do
    user = User.create!(
      email: Faker::Internet.email,
      password: 'azerty',
      restaurant: restaurant,
      )
  end

  rand(100).times do
    customer = Customer.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      phone_number: rand(1000000000),
      email: Faker::Internet.email,
      )

    rand(2).times do
      booking = Booking.create!(
        date: (Date.today..10.days.from_now).to_a.sample,
        number_of_customers: (4..10).to_a.sample,
        restaurant: restaurant,
        customer: customer,
        hour: ['12h00', '12h30', '13h00', '13h30', '19H30', '20h00', '20h30', '21h00'].sample,
        content: ['Table ronde', 'Terrasse', 'Vue mer','Discretion demandée',''].sample,
        status: ['Pending', 'Valided', 'Canceled'].sample,
        )

      # booking = Booking.create!(
      #   date: Faker::Date.forward(10),
      #   number_of_customers: (4..10).to_a.sample,
      #   restaurant: restaurant,
      #   customer: Customer.all.sample,
      #   hour: ['12h00', '12h30', '13h00', '13h30', '19H30', '20h00', '20h30', '21h00'].sample,
      #   content: ['Table ronde', 'Terrasse', 'Vue mer','Discretion demandée',''].sample,
      #   status: ['Pending', 'Valided', 'Canceled'].sample,
      # )
    end

    #
  end

    user = User.create!(
      email: 'test@atable.live',
      password: 'azerty',
      restaurant: Restaurant.last
      )
  rand(15).times do
      booking = Booking.create!(
        date: Faker::Date.forward(15),
        number_of_customers: (4..10).to_a.sample,
        restaurant: Restaurant.last,
        customer: Customer.all.sample,
        hour: ['12h00', '12h30', '13h00', '13h30', '19H30', '20h00', '20h30', '21h00'].sample,
        content: ['Table ronde', 'Terrasse', 'Vue mer','Discretion demandée',''].sample,
        status: ['Pending', 'Valided', 'Canceled'].sample,
      )
  end

Customer.create!(
      first_name: 'Raphael',
      last_name: 'Maman',
      phone_number: '0615886787',
      email: 'raphaelmamans@gmail.com',
      facebook_id: '2671800516223322',
      )






# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
