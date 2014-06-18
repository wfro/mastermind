require './lib/guess'

class GuessBuilder
  def new_guess(sequence)
    sequence = sequence.downcase.split("")
    guess = Guess.new(sequence, Time.now)
    if guess.valid?
      return guess
    else
      puts "Not a valid guess"
    end
  end
end
