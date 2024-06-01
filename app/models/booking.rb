class Booking < ApplicationRecord
  belongs_to :renter, class_name: "User"
  belongs_to :instrument

  validates :renter, presence: true
  validates :instrument, presence: true

  #validate -> regarder si booking dates comprises dans un autre booking
  validates :start_date, presence: true, comparison: { greater_than_or_equal_to: Date.today }
  validates :end_date, presence: true, comparison: { greater_than_or_equal_to: :start_date }
  validates :status, presence: true, inclusion: { in: %w[pending accepted declined] }

  # Method to find bookings where the instrument's owner is the given user
  def self.for_owner(user)
    joins(:instrument).where(instruments: { owner_id: user.id })
  end
end
