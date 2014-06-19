gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/sequence_generator'

class SequenceGeneratorTest < Minitest::Test

  def setup
    @sgdef = SequenceGenerator.new
    @sgbeg = SequenceGenerator.new('b')
    @sgint = SequenceGenerator.new('i')
    @sgexp = SequenceGenerator.new('e')
  end

  def test_generates_beginner_random_sequences_by_default
    sequence1 = @sgdef.random_sequence
    sequence2 = @sgdef.random_sequence
    assert_equal 4, sequence1.secret_sequence.size
    refute_equal sequence1, sequence2
  end

  def test_sequence_is_an_array
    sequence = @sgdef.random_sequence
    assert_equal Array, sequence.secret_sequence.class
  end

  def test_generate_beginner_sequence
    sequence = @sgbeg.random_sequence
    assert_equal 4, sequence.secret_sequence.size
  end

  def test_generate_intermediate_sequence
    sequence = @sgint.random_sequence
    assert_equal 6, sequence.secret_sequence.size
  end

  def test_generate_expert_sequence
    sequence = @sgexp.random_sequence
    assert_equal 8, sequence.secret_sequence.size
  end
end
