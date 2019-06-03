class Booking < ApplicationRecord
  belongs_to :restaurant
  belongs_to :customer
  validates :date, presence: true
  validates :hour, presence: true
  validates :number_of_customers, presence: true

end
