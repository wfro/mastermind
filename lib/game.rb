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

  

end
