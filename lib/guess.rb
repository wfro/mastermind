# Guess will have three(two?) attributes
# 1. the guess itself
# 2. a timestamp for each guess
# 3. turn number (any other place for this?)

# Validate direclty in the guess class so we can just call the validation
# methods on the guess objects.
# i.e. if guess.valid? then do your processing, if not reprompt

class Guess

  attr_reader :sequence, :timestamp

  def initialize(sequence, timestamp)
    @sequence = sequence
    @timestamp = timestamp
    @expected_length = 4
    end

  def expected_chars
    %w(r b g y)
  end

  def valid?
    valid_length? && valid_chars?
  end

  def valid_length?
    sequence.length == @expected_length
  end

  def valid_chars?
    sequence.each do |i|
      return false if !(expected_chars.include?(i))
    end
    true
  end


end
