class ProgressNote < ApplicationRecord

  after_save :parse_note

  # Relationships
  belongs_to :client
  belongs_to :therapist
  has_many :attempts

  # Validations
  validates :title, :note, presence: true


  # Parse Note Magic
  # This would likely get very large and need it's own dynamic rules engine.  SO this is NOT where this would live.
  def parse_note

    # Split note into lines
    note_lines = self.note.split /\n/

    note_lines.each do |line|

      # @NOTE Rules engine is where the magic lies -- here I will demonstrate a couple rules


      # RULE ONE - Words
      # if we match /^\w+\s+[\-\+]/ then we are possibly a word and need to be looked at closer
      if line.match /^\w+\s+[\-\+]/
        # Get our word and the attempts which there could be many of
        word, *attempts = line.split /\s/

        # @TODO check to make sure we only have +- in the attempts or something is wonky
        # @TODO Check to see if there is a , in attempts then maybe this is a list of attempts etc..
        # This can get complext fast.

        # Iterate through our attempts and save them
        attempts.join.each_char.with_index do |attempt, index|
          # Create that attempt
          create_attempt index, word, attempt
        end
      end


      # RULE TWO - Errors
      # if we match /^errors:\s*\w+/ then we possibly have a list of error words
      if line.match /^errors:\s*\w+/
        # Get our error status and then the potential words
        key, *words = line.split ':'

        # Process / Flatten words... etc.. this is quick and dirty.. again rules engine goes here
        words = words.join.strip.split /\s/

        # process each word so as to remove whatever... and then save them as a failed attempt
        words.each_with_index do |word, index|
          # @TODO process.. word. .make sure not +- etc..

          # Create that failed attempt
          create_attempt(index, word.gsub(/\W/,'')) unless word.gsub(/[0-9]/,'').empty?
        end
      end


      # RULE THREE - Nouns|Verbs:
      # If we match /^(nouns|verbs):\s[\-\+]/ then catch those +- attempts and log them as wordless attempts
      if line.match /^(nouns|verbs):\s[\-\+]/
        # Get our noun key and then the attempts
        key, *attempts = line.split ':'

        # only listen to the +- information for now.
        attempts.join.gsub(/[^\-\+]/,'').each_char.with_index do |attempt, index|
          # Create a wordless attempt
          create_attempt index, nil, attempt
        end
      end

      # @TODO Talk to this...
      # More rules... again this would be a full rules engine that we can change over time, and can apply uniquely to
      # each therapist individually.  Allowing for the ability to customize how things are parsed on a per therapist
      # level without forcing each therapist to learn a whole new way of doing things.  In fact their day to day note
      # taking wouldn't change at all and we could go back in time and reparse to gleen more data as we make the parser
      # smarter over time.

    end

  end

  private

  # Create an attempt
  def create_attempt index, word = nil, success = false

    # If word is a vocabulary then load it, else create it OR use nil if we didnt get one
    word = Vocabulary.where(word: word.downcase.strip).first_or_create unless word.nil?

    # @TODO Check to make sure this index hasn't been created already
    # @TODO we know which +|- we are talking about, so avoid duplicates of same attempt

    # Fire off the attempt
    Attempt.create client: self.client,
                   note_index: index,
                   vocabulary: word,
                   progress_note: self,
                   successful: (success == '+' ? true : false)

  end


end
