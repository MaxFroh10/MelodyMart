class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :instruments
  validates :name, presence: true
end
