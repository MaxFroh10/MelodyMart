class Instrument < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :bookings

  validates :name, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :picture, presence: true

  validates :owner, presence: true
end
