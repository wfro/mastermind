require './lib/sequence'

class SequenceGenerator
  attr_reader :difficulty

  def initialize(difficulty='b')
    @difficulty = difficulty.downcase
  end

  def random_sequence
    sequence_size = 0

    case difficulty
    when 'b' then sequence_size = 4
    when 'i' then sequence_size = 5
    when 'e' then sequence_size = 6
    end

    @characters = ['r', 'b', 'g', 'y']
    sequence = []
    sequence_size.times do |i|
      sequence[i] = @characters[(rand(0...@characters.length))]
    end
    Sequence.new(sequence)
  end
end
