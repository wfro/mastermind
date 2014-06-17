# Guess will have three(two?) attributes
# 1. the guess itself
# 2. a timestamp for each guess
# 3. turn number (any other place for this?)

class Guess

  attr_reader :input, :timestamp, :turn

  def initialize(input, timestamp, turn)
    @input = input
    @timestamp = timestamp
    @turn = turn
  end

end
