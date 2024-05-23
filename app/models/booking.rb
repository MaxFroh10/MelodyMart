class Booking < ApplicationRecord
  belongs_to :renter, class_name: "User"
  belongs_to :instrument
  belongs_to :owner, throught: :instrument, class_name: "User"

  validates :renter, presence: true
  validates :instrument, presence: true

  validates :start_date, presence: true, date: { after: Date.today }
  validates :end_date, presence: true, date: { after: :start_date }
  validates :status, presence: true, inclusion: { in: %w(pending accepted declined) }
end
