# Main entry point currently.  Presents a simple menu to the user
# and creates an instance of Game should us.

require './lib/game'

class CLI

  def instructions
    "guess a sequence of n characters"
  end


  def self.menu
    # quit, play, instructions
    puts "Intro message placeholder"
    command = ''
    while command != 'q' || command != 'p'
      # get input and
      command = gets.chomp

      case command
      when 'q' then puts "Bye."
      when 'p' then Game.new.play
      when 'i' then instructions
      else
        puts "I don't recognize that command."
      end
    end
  end

  def self.run
  end

end

CLI.menu
