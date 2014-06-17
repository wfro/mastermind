gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/sequence'
require './lib/sequence_generator'

class SequenceTest < Minitest::Test
  def test_has_secret_sequence
    sequence = SequenceGenerator.random_sequence
    assert_equal 4, sequence.secret_sequence.length
  end
end
