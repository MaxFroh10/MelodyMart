class Instrument < ApplicationRecord
  has_many :bookings
  has_one_attached :picture
  belongs_to :owner, class_name: "User"
  belongs_to :category
  belongs_to :subcategory

  validates :name, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :owner, presence: true

  def self.by_owner(owner)
    where(owner_id: owner.id)
  end
end
