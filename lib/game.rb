require './lib/sequence_matcher'
require './lib/sequence_generator'
require './lib/guess'
require './lib/guess_builder'
require './lib/guess_printer'

class Game

  attr_reader :total_turns, :guesses
  def initialize(difficulty='b')
    @difficulty  = difficulty
    @guesses     = []
    @start_time  = ''
    @end_time    = ''
    @answer      = SequenceGenerator.new(difficulty).random_sequence
  end

  def history
    puts "Guess History:\n"
    print "Guess:   "
    guesses.each do |i|
      print i.sequence.join("") + " "
    end
    puts ""
    print "Turn #:   "
    1.upto(total_turns) do |i|
      print i.to_s + "   "
    end
    puts ""
  end

  def play
    @start_time = Time.now
    intro_message(@difficulty)
    loop do
      user_sequence = gets.chomp.to_s
      if user_sequence == 'q'
        end_time
        puts "You guessed #{total_turns} times over a period of #{total_time} seconds."
        abort # mission
      elsif user_sequence == 'history'
        history
      end

      current_guess = guess(user_sequence, @difficulty)

      if current_guess # check if input was valid and Guess instance was created
        match_data = match(current_guess, @answer)
        if match_data.full_match?
          print_end_game_output('win')
        elsif total_turns == 19 # on last guess
          puts "No more guesses!"
          break
        else
          print_results(match_data)
          @guesses << current_guess
          num_turns
          puts "Try again."
          print "> "
        end
      end
    end
    print_end_game_output('loss')
  end

  def print_end_game_output(outcome)
    end_time
    if outcome == 'win'
      win_message
    elsif outcome =='loss'
      loss_message
    end
    reprompt
  end

  def num_turns
    if @guesses.length == 1
      puts "You've taken #{@guesses.length} guess."
    else
      puts "You've taken #{@guesses.length} guesses."
    end
  end

  def guess(input, difficulty)
    GuessBuilder.new.new_guess(input, difficulty)
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

  def intro_message(difficulty)
    print_diff = ''
    colors = ''
    len = 4
    case difficulty
    when 'b'
      print_diff = 'beginner'
      colors     = "(r)ed, (g)reen, (b)lue, and (y)ellow"
    when 'i'
      print_diff = 'intermediate'
      colors     = "(r)ed, (g)reen, (b)lue, (y)ellow, and (o)range."
      len = 5
    when 'e'
      print_diff = 'expert'
      colors     = "(r)ed, (g)reen, (b)lue, (y)ellow, (o)range, and (p)urple."
      len = 6
    else
      print_diff = 'beginner'
      "(r)ed, (g)reen, (b)lue, and (y)ellow"
    end

    puts "I have generated a #{print_diff} sequence with #{len} elements made up of:"
    puts "#{colors}. Use (q)uit at any time to end the game."
    puts "What's your guess?"

    puts "Answer = #{@answer.secret_sequence}"
  end

  def loss_message
    puts "\nSorry, you are out of guesses!"
    puts "Total time played: #{total_time} seconds"
  end

  def win_message
    puts "\nCongratulations! You guessed the sequence #{@answer.secret_sequence.join("")} in"
    puts "#{@guesses.length} guesses over #{total_time} seconds."
  end

  def reprompt
    puts "Do you want to (p)lay again or (q)uit?"
    print "> "
  end

end
