require './lib/sequence_matcher'
require './lib/sequence_generator'
require './lib/guess'
require './lib/guess_builder'
require './lib/guess_printer'

class Game

  attr_reader :total_turns, :guesses

  def initialize
    @guesses     = []
    @start_time  = ''
    @end_time    = ''
    @answer      = SequenceGenerator.random_sequence
    @game_over   = false
  end



  def play
    @start_time = Time.now
    puts "I have generated a beginner sequence with four elements made up of:"
    puts "(r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
    puts "What's your guess?"

    puts "Answer = #{@answer.secret_sequence}"

    keep_running = true

    while keep_running

      user_sequence = gets.chomp.to_s
      if user_sequence == 'q'
        @game_over = true
        end_time
        break
      end

      current_guess = guess(user_sequence)

      if current_guess # check if input was valid and Guess instance was created
        match_data = match(current_guess, @answer)
        if match_data.full_match?
          end_time
          keep_running = false
          win_message
          reprompt
        else
          print_results(match_data)
          @guesses << current_guess
          num_turns
          puts "Try again."
          print "> "
        end
      end

      if total_turns > 1
        @game_over = true
        end_time
        loss_message
        reprompt
        break
      end
    end
  end

  def num_turns
    if @guesses.length == 1
      puts "You've taken #{@guesses.length} guess."
    else
      puts "You've taken #{@guesses.length} guesses."
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

  def total_turns
    guesses.length
  end

  def end_time
    @end_time = Time.now
  end

  def total_time
    @end_time - @start_time
  end

  def loss_message
    puts "\nSorry, you are out of guesses!"
    puts "Total time played: #{total_time} seconds"
  end

  def win_message
    puts "\nCongratulations! You guessed the sequence #{@answer.secret_sequence} in"
    puts "#{@guesses.length} guesses over #{total_time} seconds."
  end

  def reprompt
    puts "Do you want to (p)lay again or (q)uit?"
    puts "> "
  end

  def game_over?
    @game_over
  end

end
