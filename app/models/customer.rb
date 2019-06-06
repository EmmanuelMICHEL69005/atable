class Customer < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews
  validates :email, uniqueness: true
  accepts_nested_attributes_for :bookings
end
