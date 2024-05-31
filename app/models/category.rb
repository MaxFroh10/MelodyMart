class Category < ApplicationRecord

  has_many :instruments
  validates :name, presence: true

end
