require './lib/guess'

class GuessBuilder
  def new_guess(sequence)
    sequence = sequence.downcase.split("")
    guess = Guess.new(sequence)
    if guess.valid?
      return guess
    else
      if !(guess.valid_length?)
        puts "Not a valid guess: must be exactly 4 characters."
        print "> "
      elsif !(guess.valid_chars?)
        puts "Not a valid guess: must be only characters a-z."
        print "> "
      end
    end
  end
end
