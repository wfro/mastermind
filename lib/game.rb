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

  attr_reader :total_turns, :guesses

  def initialize
    @guesses = []
    @total_turns = @guesses.length + 1
    @start_time = Time.now
    @end_time = ''
    @answer = SequenceGenerator.random_sequence
    @game_over = false
  end

  def play
    puts "I have generated a beginner sequence with four elements made up of:"
    puts "(r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
    puts "What's your guess?"

    keep_running = true
    puts "Answer = #{@answer.secret_sequence}"

    while keep_running
      puts "Top of game loop"
      user_sequence = gets.chomp.to_s
      current_guess = guess(user_sequence)

      # check if user input passed validation and Guess was insantiated
      if current_guess
        match_data = match(current_guess, @answer)
        if match_data.full_match?
          @end_time = Time.now
          keep_running = false
          exit_message
        else
          print_results(match_data)
          @guesses << current_guess
          puts "Try again."
          print "> "
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

  def exit_message
    @game_over = true
    total_time = @start_time = @end_time
    puts "total time #{total_time}"
    puts 'win'
  end

  def game_over?
    @game_over
  end

end
