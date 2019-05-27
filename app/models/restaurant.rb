class Restaurant < ApplicationRecord
  has_many :bookings
  has_many :customers, through: :bookings
  has_many :users

end
