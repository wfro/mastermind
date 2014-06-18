require './lib/sequence'

class SequenceGenerator
  def self.random_sequence
    @characters = ['r', 'b', 'g', 'y']
    sequence = []
    @characters.size.times do |i|
      sequence[i] = @characters[(rand(0...@characters.length))]
    end
    Sequence.new(sequence)
  end
end
