# Generate random sequence from characters 'r', 'g', 'b', 'y'
require './lib/sequence'

class SequenceGenerator
  def self.random_sequence
    @characters = ['r', 'b', 'g', 'y']
    # return string for consistency with user inputs
    Sequence.new(@characters.shuffle)
  end
end
