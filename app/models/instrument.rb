class Instrument < ApplicationRecord
  belongs_to :owner, class_name: "User"

  validates :name, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :picture, presence: true
end
