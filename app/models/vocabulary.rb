class Vocabulary < ApplicationRecord

  # Relationships
  has_many :attempts

  # Validations
  validates :word, presence: true

end