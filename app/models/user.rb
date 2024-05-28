class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :instruments, foreign_key: :owner_id, dependent: :destroy
  geocoded_by :complete_address
  after_validation :geocode

  def complete_address
    [address, city, state, zip, country].compact.join(', ')
  end
end
