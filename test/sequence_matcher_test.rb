# Test will not pass unless answer.secret_sequence changed to answer.
# Implementation is dealing with Sequence objects being passed in, and
# # the arrays need to be hardcoded to check for content/position.


gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/sequence'
require './lib/sequence_matcher'
require './lib/guess_builder'
require './lib/sequence_generator'


class SequenceMatcherTest < Minitest::Test

  def setup
    @answer_no_cc     = Sequence.new(['y', 'y', 'y', 'y'])
    @answer_cc_and_cp = Sequence.new(['y', 'y', 'b', 'g'])
    @answer_correct   = Sequence.new(['r', 'r', 'b', 'g'])
    @answer_no_cp     = Sequence.new(['y', 'y', 'y', 'y'])

  end

  def test_it_exists
    matcher = SequenceMatcher.new(GuessBuilder.new.new_guess("rrgr"), SequenceGenerator.new.random_sequence)
    assert matcher
  end

  def test_guess_has_no_correct_content
    matcher = SequenceMatcher.new(GuessBuilder.new.new_guess("rrbg"), @answer_no_cc)
    assert_equal 0, matcher.correct_content
  end

  def test_guess_has_correct_content_in_correct_position
    matcher = SequenceMatcher.new(GuessBuilder.new.new_guess("rrbg"), @answer_cc_and_cp)
    assert_equal 2, matcher.correct_position
  end

  def test_guess_has_no_correct_positions
    matcher = SequenceMatcher.new(GuessBuilder.new.new_guess("rrrr"), @answer_no_cp)
    assert_equal 0, matcher.correct_position
  end

  def test_guess_is_correct
    matcher = SequenceMatcher.new(GuessBuilder.new.new_guess("rrbg"), @answer_correct)
    matcher.correct_content

    assert_equal true, matcher.full_match?
  end
end
