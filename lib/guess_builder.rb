require './lib/guess'

class GuessBuilder

  def new_guess(sequence, difficulty='b')
    sequence = sequence.downcase.split("")
    guess = Guess.new(sequence, difficulty)
    if guess.valid?
      return guess
    else
      if !(guess.valid_chars?)
        puts "Not a valid guess: must be only available colors."
        print "> "
      elsif !(guess.valid_length?)
        puts "Not a valid guess: make sure guesses are the correct length."
        print "> "
      end
    end
  end

end
