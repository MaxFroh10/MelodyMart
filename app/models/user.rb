class User < ApplicationRecord
  validates :email, presence: :true, uniqueness: :true

  has_many :instruments, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
