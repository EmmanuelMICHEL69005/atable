class Restaurant < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :customers, through: :bookings
  has_many :users, dependent: :destroy
end
