require 'faker'
Restaurant.destroy_all
User.destroy_all
Customer.destroy_all
Booking.destroy_all


# REEL DATA

restaurant = Restaurant.create!(name: 'Le Wagon Bar', address: '20 rue des Capucins', zipcode: '69000', city: 'Lyon', capacity: 50 )

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
  source: 'Facebook',
  hour: '12h30',
  content: 'Terrasse',
  status: 'New',
)

['10/01/2019', '28/02/2019', '30/03/2019', '15/04/2019', '01/05/2019'].each do |d|
  Booking.create!(
  date: d,
  number_of_customers: rand(2..6),
  restaurant: restaurant,
  customer: kevin,
  source: ['Facebook', 'La Fourchette', 'Site web', 'Telephone', 'Other'].sample,
  hour: ['12h30', '13h30', '19h30', '20h30', '21h00'].sample,
  content: ["Il s'agit d'un anniversaire", '', '','','Table ronde svp', 'Menu vegetarian svp'].sample,
  status: 'Service rendu',
)
end

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
  source: 'La Fourchette',
  hour: '19h30',
  content: 'Terrasse',
  status: 'New'
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
  source: 'La Fourchette',
  hour: '20h30',
  content: 'une table Cool',
  status: 'New'
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
  source: 'La Fourchette',
  hour: '13h30',
  content: 'Terrasse',
  status: 'New'
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
  source: 'La Fourchette',
  hour: '13hOO',
  content: 'Terrasse',
  status: 'New'
)

maxime = Customer.create!(
  first_name: "maxime",
  last_name: "givry",
  phone_number: "0675342561",
  email: "maxime.narcoleptique@gmail.com",
  )

maxime_booking1 = Booking.create!(
  date: Date.today,
  number_of_customers: 4,
  restaurant: restaurant,
  customer: maxime,
  source: 'La Fourchette',
  hour: '19h00',
  content: 'un canapé svp',
  status: 'New'
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
  source: 'La Fourchette',
  customer: alex,
  hour: '20h30',
  status: 'Valided'
)

User.create!(
  email: 'test@atable.live',
  password: 'azerty',
  restaurant: Restaurant.last
)






# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
