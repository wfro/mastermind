class Guess

  attr_reader :sequence, :timestamp

  def initialize(sequence, difficulty='b')
    @sequence = sequence
    @timestamp = timestamp
    @difficulty = difficulty
  end

  def expected_length
    case @difficulty
    when 'b' then return 4
    when 'i' then return 5
    when 'e' then return 6
    end
  end

  def expected_chars
    %w(r b g y)
  end

  def valid?
    valid_length? && valid_chars?
  end

  def valid_length?
    sequence.length == expected_length
  end

  def valid_chars?
    sequence.each do |i|
      return false if !(expected_chars.include?(i))
    end
    true
  end

end
