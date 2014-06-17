require './lib/guess'

class GuessBuilder
  def initialize(guess)
    @guess = guess # string at this point
  end

  def new_guess
    # can we create the Guess objects in initialize?
    guess = @guess.downcase.split("")
    timestamp = Time.now
    turn = 0 # placeholder for now
    Guess.new(guess, timestamp, turn)
  end
end
