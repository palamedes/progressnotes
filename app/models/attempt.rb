class Attempt < ApplicationRecord

  # Relationships
  belongs_to :vocabulary
  belongs_to :client

  # Validations
  validates :client, :vocabulary, presence: true

end