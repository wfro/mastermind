# Guess will have three(two?) attributes
# 1. the guess itself
# 2. a timestamp for each guess
# 3. turn number (any other place for this?)

class Guess

  attr_reader :input, :timestamp, :turn_number

  def initialize(input, timestamp, turn_number)
    @input = input
    @timestamp = timestamp
    @turn_number = turn_number
  end
  
end
