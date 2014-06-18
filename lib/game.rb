# Store guesses
# Keep timer
# Store history (later feature)
#
# What else will game do?  Create functions here and decide where to put them
# Where am I going to create all of the objects and actually execute the code

require './lib/sequence_matcher'
require './lib/sequence_generator'
require './lib/guess'
require './lib/guess_builder'
require './lib/guess_printer'

class Game

  attr_reader :total_turns

  def initialize
    @guesses = []
    @total_turns = @guesses.length + 1
    @start_time = Time.now
    @answer = SequenceGenerator.random_sequence
  end

  def play
    # Bulk of logic for actually running the game
    puts "I have generated a beginner sequence with four elements made up of:"
    puts "(r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
    puts "What's your guess?"

    keep_running = true
    while keep_running
      puts "new_game loop"
      user_sequence = gets.chomp.to_s
      current_guess = guess(user_sequence)
      if current_guess.valid?
        match_data = match(current_guess), @answer)
        if match_data.full_match?
          pass
        else
          print_results(match_data)
        end
      end
    end
  end

  def guess(input)
    GuessBuilder.new.new_guess(input)
  end

  def match(guess, answer)
    SequenceMatcher.new(guess, answer)
  end

  def print_results(match_data)
    gp = GuessPrinter.new(match_data)
    gp.print_output
  end

  def guesses
    @guesses
  end

  def <<(guess)
    @guesses << guess
  end

  def exit(result)
    # if result == 'win'
  end

end
