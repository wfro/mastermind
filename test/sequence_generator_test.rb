gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/sequence_generator'

class SequenceGeneratorTest < Minitest::Test
  def test_generates_random_sequences
    sequence1 = SequenceGenerator.random_sequence
    sequence2 = SequenceGenerator.random_sequence
    assert_equal 4, sequence1.secret_sequence.size
    refute_equal sequence1, sequence2
  end

  def test_sequence_is_an_array
    sequence = SequenceGenerator.random_sequence
    assert_equal Array, sequence.secret_sequence.class
  end
end
