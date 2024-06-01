class Booking < ApplicationRecord
  belongs_to :renter, class_name: "User"
  belongs_to :instrument

  validates :renter, presence: true
  validates :instrument, presence: true
  validates :start_date, presence: true, comparison: { greater_than_or_equal_to: Date.today }
  validates :end_date, presence: true, comparison: { greater_than_or_equal_to: :start_date }
  validates :status, presence: true, inclusion: { in: %w[pending accepted declined] }
  validate :dates_do_not_overlap 

  # Method to find bookings where the instrument's owner is the given user
  def self.for_owner(user)
    joins(:instrument).where(instruments: { owner_id: user.id })
  end

  private

  def dates_do_not_overlap
    overlapping_bookings = Booking.where(instrument_id: instrument_id)
                                  .where.not(id: id)
                                  .where('start_date < ? AND end_date > ?', end_date, start_date)

    return unless overlapping_bookings.exists?

    errors.add(:base, 'Les dates de réservation se chevauchent avec une autre réservation.')
  end
end
