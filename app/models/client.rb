class Client < ApplicationRecord

  # Relationships
  belongs_to :therapist
  has_many :progress_notes
  has_many :attempts

  has_many :words, -> { distinct }, through: :attempts, source: :vocabulary

  # Validations
  validates :name, presence: true

end
