class ProgressNote < ApplicationRecord

  # Relationships
  belongs_to :client
  belongs_to :therapist

  # Validations
  validates :title, :note, presence: true

end
