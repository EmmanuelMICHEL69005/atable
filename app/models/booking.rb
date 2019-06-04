class Booking < ApplicationRecord
  belongs_to :restaurant
  belongs_to :customer
  validates :date, presence: true
  validates :hour, presence: true
  validates :number_of_customers, presence: true
  validate :customer_sum_cannot_be_sup_than_capacity

  scope :midi, -> { where(hour: %w[12h00 12h30 13h00 13h30]) }
  scope :soir, -> { where(hour: %w[19h00 19h30 20h00 20h30]) }

  def midi?
    hour.in? %w[12h00 12h30 13h00 13h30]
  end

  def soir?
    hour.in? %w[19h00 19h30 20h00 20h30]
  end

  def customer_sum_cannot_be_sup_than_capacity
    bookings = restaurant.bookings.where(date: date)

    if midi?
      bookings = bookings.midi
    else
      bookings = bookings.soir
    end

    places_already_booking = bookings.sum(:number_of_customers)
    restaurant_capacity = restaurant.capacity

    not_enough_places = (restaurant_capacity - places_already_booking < number_of_customers)

    if not_enough_places
      errors.add(:number_of_customers, "il n y a pas assez de places")
    end
  end
end
