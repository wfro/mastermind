require './lib/guess'

class GuessBuilder
  def initialize(guess)
    @guess = guess #string at this point
  end

  def new_guess
    guess = @guess.downcase.split("")
    timestamp = Time.now
    turn_number = 0 # placeholder for now
    Guess.new(guess, timestamp, turn_number)
  end
end
