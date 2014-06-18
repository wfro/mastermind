class Guess

  attr_reader :sequence, :timestamp

  def initialize(sequence)
    @sequence = sequence
    @timestamp = timestamp
    @expected_length = 4
    end

  def expected_chars
    %w(r b g y)
  end

  def valid?
    valid_length? && valid_chars?
  end

  def valid_length?
    sequence.length == @expected_length
  end

  def valid_chars?
    sequence.each do |i|
      return false if !(expected_chars.include?(i))
    end
    true
  end

end
