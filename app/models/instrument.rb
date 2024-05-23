class Instrument < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :bookings

  validates :name, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :picture, presence: true


  def available?(start_date, end_date)
    bookings.each do |booking|
      if (start_date..end_date).overlaps?(booking.start_date..booking.end_date)
        return false
      end
    end
    true
  end
end
