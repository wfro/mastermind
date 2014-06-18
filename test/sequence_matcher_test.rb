# Test will not pass unless answer.secret_sequence changed to answer.
# Implementation is dealing with Sequence objects being passed in, and
# the arrays need to be hardcoded to check for content/position.


# gem 'minitest', '~> 5.2'
# require 'minitest/autorun'
# require 'minitest/pride'
#
# require './lib/sequence'
# require './lib/sequence_matcher'
# require './lib/guess'
# require './lib/sequence_generator'
#
# class SequenceMatcherTest < Minitest::Test
#   def test_guess_has_correct_content
#     # hardcoded answer here for testing purposes
#
#     matcher = SequenceMatcher.new(GuessBuilder.new.new_guess("rrgr"), SequenceGenerator.random_sequence)
#     answer = matcher.
#     assert_equal 2, matcher.correct_content
#   end
#
#   # def test_guess_has_no_correct_content
#   #   matcher = SequenceMatcher.new(Guess.new("rrbg"), ['y', 'y', 'y', 'y'])
#   #   assert_equal "No correct content.", matcher.correct_content
#   # end
#   #
#   def test_guess_has_correct_content_in_correct_position
#     matcher = SequenceMatcher.new(Guess.new("rrbg"), ['r', 'r', 'b', 'g'])
#
#     assert_equal 2, matcher.correct_position
#   end
  #
  # # find a way to combine this with no correct content, if no correct content
  # # than no correct positions
  # def test_guess_has_no_correct_positions
  #   matcher = SequenceMatcher.new(Guess.new("rrrr"), ['y', 'y', 'b', 'g'])
  #   assert_equal "No correct positions.", matcher.correct_position
  # end
  #
  # def test_guess_is_correct
  #   matcher = SequenceMatcher.new(Guess.new("rrbg"), ['r', 'r', 'b', 'g'])
  #   # puts matcher.guess
  #   # puts matcher.answer
  #   # assert_equal matcher.guess, matcher.answer
  #   matcher.correct_content
  #   assert_equal true, matcher.full_match?
  # end
# end
