class Booking < ApplicationRecord
  belongs_to :renter
  belongs_to :instrument
end
