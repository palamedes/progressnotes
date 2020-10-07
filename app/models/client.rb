class Client < ApplicationRecord

  # Relationships
  belongs_to :therapist
  has_many :progress_notes

  # Validations
  validates :name, presence: true

end
