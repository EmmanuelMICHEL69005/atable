require 'faker'
Restaurant.destroy_all
User.destroy_all
Customer.destroy_all
Booking.destroy_all


# REEL DATA


restaurant = Restaurant.create!(name: 'Le Wagon Bar', address: '20 rue des Capucins', zipcode: '69000', city: 'Lyon', capacity: 38 )

Manu = User.create!(
  email: 'manu@atable.live',
  password: 'azerty',
  restaurant: Restaurant.last
)
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

Review.create!(
  user: Manu,
  customer: kevin,
  date: '04/04/2019',
  nature: 'Salle',
  content: 'Le client préfère les tables proches des fenêtres.'
  )

Review.create!(
  user: Manu,
  customer: kevin,
  date: '25/03/2019',
  nature: 'Cuisine',
  content: 'Le plat qui a été servi était trop salé.'
  )

Review.create!(
  user: Manu,
  customer: kevin,
  date: '01/02/2019',
  nature: 'Service',
  content: 'Le client apprécie un service décontracté et convivial.'
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
  last_name: "droz",
  phone_number: "0675342561",
  email: "mathieu.droz@gmail.com",
  )

mathieu_booking1 = Booking.create!(
  date: 2.days.from_now,
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
  last_name: "cordelle",
  phone_number: "",
  email: "joseph@gmail.com",
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
  last_name: "smith",
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
  status: 'Valided'
)

gerard = Customer.create!(
  first_name: "gerard",
  last_name: "paul",
  phone_number: "05476996890",
  email: "gerard.paul@gmail.com",
  )

gerard_booking1 = Booking.create!(
  date: Date.today,
  number_of_customers: 3,
  restaurant: restaurant,
  customer: gerard,
  source: 'La Fourchette',
  hour: '13hOO',
  content: 'Terrasse',
  status: 'Valided'
)

maxime = Customer.create!(
  first_name: "maxime",
  last_name: "givry",
  phone_number: "0675342561",
  email: "maxime.givry@gmail.com",
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
  source: 'Site web',
  customer: alex,
  hour: '20h30',
  status: 'Valided'
)

charly = Customer.create!(
  first_name: "charly",
  last_name: "grandpre",
  phone_number: "0675342561",
  email: "charly.grandpre@gmail.com",
  )

charly_booking1 = Booking.create!(
  date: 1.days.from_now,
  number_of_customers: 7,
  restaurant: restaurant,
  customer: charly,
  source: 'Site web',
  hour: '19h30',
  content: 'Terrasse',
  status: 'New'
)

pierre = Customer.create!(
  first_name: "pierre",
  last_name: "mazille",
  phone_number: "0675342561",
  email: "pierre.mazille@gmail.com",
  )

pierre_booking1 = Booking.create!(
  date: 1.days.from_now,
  number_of_customers: 7,
  restaurant: restaurant,
  customer: pierre,
  source: 'Site web',
  hour: '20h30',
  content: 'Terrasse',
  status: 'New'
)

florian = Customer.create!(
  first_name: "florian",
  last_name: "guerbette",
  phone_number: "0675342561",
  email: "florian.guerbette@gmail.com",
  )

florian_booking1 = Booking.create!(
  date: 1.days.from_now,
  number_of_customers: 7,
  restaurant: restaurant,
  customer: florian,
  source: 'Site web',
  hour: '19h30',
  content: 'Terrasse',
  status: 'New'
)

juliette = Customer.create!(
  first_name: "juliette",
  last_name: "boge",
  phone_number: "0675342561",
  email: "juliette.boge@gmail.com",
  )

juliette_booking1 = Booking.create!(
  date: 1.days.from_now,
  number_of_customers: 7,
  restaurant: restaurant,
  customer: juliette,
  source: 'Site web',
  hour: '13h00',
  content: 'Terrasse',
  status: 'Valided'
)

léa = Customer.create!(
  first_name: "léa",
  last_name: "gavoille",
  phone_number: "0675342561",
  email: "léa.gavoille@gmail.com",
  )

léa_booking1 = Booking.create!(
  date: 1.days.from_now,
  number_of_customers: 7,
  restaurant: restaurant,
  customer: léa,
  source: 'Site web',
  hour: '13h00',
  content: 'Terrasse',
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
