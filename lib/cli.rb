# Main entry point currently.  Presents a simple menu to the user
# and creates an instance of Game should us.

require './lib/game'

class CLI

  def self.instructions
    puts "\nMASTERMIND:"
    puts
    puts "\t-- A random sequence of four colors will be generated."
    puts "\t-- Possible options include (r)ed, (b)lue, (g)reen, and (y)ellow,"
    puts "\t   and any combination the four is valid, including duplicates."
    puts "\t   For example 'rrrr' is a valid code."
    puts "\t-- Your goal is to correctly guess the randomly generated code"
    puts "\t   as quickly as possible."
    puts "\t-- Enter your guess into the console, valid guesses include any and"
    puts "\t   all combinations of the four colors."
    puts "\t-- And most importantly, GG no re."
    puts
    print "> "
  end


  def self.menu
    puts "\nWelcome to MASTERMIND"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print "> "

    game = Game.new
    command = ''
    while command != 'q'
      break if game.game_over?

      command = gets.chomp

      case command
        when 'p' then game.play
        when 'i' then instructions
        else
          puts "I don't recognize that command."
          puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
          print "> "
      end
    end
    puts "Thanks for playing!"
  end

  def self.run
    CLI.menu
  end

end
