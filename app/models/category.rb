class Category < ApplicationRecord
  has_many :instruments, dependent: :destroy
  CATEGORIES = ['String', 'Wind', 'Percussion', 'Keyboard', 'Electronic']

  validates :name, presence: true, inclusion: { in: CATEGORIES }
end
