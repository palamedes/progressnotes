class ProgressNote < ApplicationRecord

  after_save :parse_note

  # Relationships
  belongs_to :client
  belongs_to :therapist

  # Validations
  validates :title, :note, presence: true


  # Parse Note Magic
  # This would likely get very large and need it's own dynamic rules engine.  SO this is NOT where this would live.
  def parse_note

    # Split note into lines
    note_lines = self.note.split /\n/

    note_lines.each do |line|

      # if we match /^\w+\s+[\-\+]/ then we are possibly a word and need to be looked at closer
      if line.match /^\w+\s+[\-\+]/
        # Get our word and the attempts which there could be many of
        word, *attempts = line.split /\s/

        # If word is a vocabulary then load it, else create it.
        word = Vocabulary.where(word: word.downcase.strip).first_or_create

        # @TODO check to make sure we only have +- in the attempts or something is wonky
        # @TODO Check to see if there is a , in attempts then maybe this is a list of attempts etc..
        # This can get complext fast.

        # Iterate through our attempts and save them
        attempts.join.each_char do |attempt|

          Attempt.create client: self.client,
                         vocabulary: word,
                         successful: (attempt == '+' ? true : false)

        end

      end

    end

  end

end
