require './lib/sequence'

class SequenceGenerator
  attr_reader :difficulty

  def initialize(difficulty='b')
    @difficulty = difficulty.downcase
  end

  def random_sequence
    @characters = ['r', 'b', 'g', 'y']
    length = 4

    case difficulty
    when 'i' then @characters << 'o'; length = 6 # orange
    when 'e' then @characters << 'p'; length = 8  # purple
    end

    sequence = []
    length.times do |i|
      sequence[i] = @characters[(rand(0...@characters.length))]
    end
    Sequence.new(sequence)
  end
end
