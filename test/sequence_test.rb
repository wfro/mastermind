gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/sequence'
require './lib/sequence_generator'

class SequenceTest < Minitest::Test
  def test_it_exists
    sequence = SequenceGenerator.random_sequence
    assert sequence
  end

  def test_has_secret_sequence
    sequence = SequenceGenerator.random_sequence
    assert_equal 4, sequence.secret_sequence.length
  end

  def test_secret_is_an_array
    sequence = SequenceGenerator.random_sequence
    assert_equal Array, sequence.secret_sequence.class
  end
end
