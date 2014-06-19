class Guess

  attr_reader :sequence, :timestamp, :expected

  def initialize(sequence, difficulty='b')
    @sequence = sequence
    @timestamp = timestamp
    @difficulty = difficulty
    @expected = []
  end

  def expected_length
    case @difficulty
    when 'b' then expected_chars(4); return 4
    when 'i' then expected_chars(5); return 6
    when 'e' then expected_chars(6); return 8
    end
  end

  def expected_chars(n)
    possible = %w[r b g y o p]
    n.times do |i|
      @expected << possible[i]
    end
  end

  def valid?
    valid_length? && valid_chars?
  end

  def valid_length?
    sequence.length == expected_length
  end

  def valid_chars?
    sequence.each do |i|
      return false if !(@expected.include?(i))
    end
    true
  end

end
