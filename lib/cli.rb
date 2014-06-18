# Main entry point currently.  Presents a simple menu to the user
# and creates an instance of Game should us.

require './lib/game'

class CLI

  def self.instructions
    puts "put some instructions here"
    print "> "
  end


  def self.menu
    puts "Welcome to MASTERMIND"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print "> "

    game = Game.new
    command = ''
    while command != 'q'
      puts "Top of menu loop"
      break if game.game_over?

      command = gets.chomp

      case command
        when 'q' then puts "Bye."
        when 'p' then game.play
        when 'i' then instructions
        else puts "I don't recognize that command."
      end
    end
  end

  def self.run
  end

end

CLI.menu
