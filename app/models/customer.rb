class Customer < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates :email, uniqueness: true
  accepts_nested_attributes_for :bookings
end
