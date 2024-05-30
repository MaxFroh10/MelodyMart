class Subcategory < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :name, uniqueness: { scope: :category_id }
  validates :validate_subcategory_name

  private

  def validate_subcategory_name
    valid_subcategories = {
      "String" => ["Banjo", "Guitar", "Harp", "Violin"],
      "Wind" => ["Clarinet", "Flute", "Saxophone", "Trumpet"],
      "Percussion" => ["Drums", "Marimba", "Timpani", "Xylophone"],
      "Keyboard" => ["Harpsichord", "Organ", "Piano", "Synthesizer"],
      "Electronic" => ["Drum machine", "Sampler", "Synthesizer", "Theremin"]
    }
    unless valid_subcategories[category.name]&.include?(name)
      errors.add(:name, "is not valid for the category #{category.name}")
    end
  end
end
