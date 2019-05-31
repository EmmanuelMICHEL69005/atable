bookings_attributes = {
  date: Date.today,
  hour: '19h',
  number_of_customers: 4,
  restaurant: Restaurant.last
}

customer = Customer.create!(last_name: "MARTIN", first_name: "jojo", email: "jojo@gmail.com", bookings_attributes: [bookings_attributes])


ap customer
ap customer.bookings
