# Store guesses
# Keep timer
# Store history (later feature)
#
# What else will game do?  Create functions here and decide where to put them
# Where am I going to create all of the objects and actually execute the code


class Game

  def initialize
    @guesses = []
    # @turn = 0
  end

  def guesses
    @guesses
  end

  def <<(guess)
    @guesses << guess
  end

  def start
  
  end


  def menu
    # quit, play, instructions
    puts "Intro message placeholder"
    command = ''
    while command != 'q'
      # get input and
      command = gets.chomp
      case command
      when 'q' then puts "Goodbye.  Make this clever eventually."
      when 'p' then # start game loop
      when 'i' then instructions
      end
    end
  end

end
