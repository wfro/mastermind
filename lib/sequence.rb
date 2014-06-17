class Sequence
  attr_reader :secret_sequence

  def initialize(secret_sequence)
    @secret_sequence = secret_sequence
  end
end
