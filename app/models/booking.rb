class Booking < ApplicationRecord
  belongs_to :renter, class_name: "User"
  belongs_to :instrument

  validates :renter, presence: true
  validates :instrument, presence: true

  validates :start_date, presence: true, comparison: { greater_than: Time.now }
  validates :end_date, presence: true, comparison: { greater_than: :start_date }
  validates :status, presence: true, inclusion: { in: %w[pending accepted declined] }
end
