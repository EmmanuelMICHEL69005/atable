class Customer < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates :email, uniqueness: true, format: { with: /\A.*@.*\.com\z/ }
  accepts_nested_attributes_for :bookings
end
