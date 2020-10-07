class Therapist < ApplicationRecord

  # Relationships
  has_many :clients
  has_many :progress_notes

  # Validations
  validates :name, presence: true

end
