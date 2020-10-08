class Attempt < ApplicationRecord

  # Relationships
  belongs_to :vocabulary, optional: true
  belongs_to :client
  belongs_to :progress_note

  # Validations
  validates :client, :note_index, presence: true

end