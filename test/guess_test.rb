gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/guess'

class GuessTest < Minitest::Test
  def test_has_attributes
    guess = Guess.new("rrbg", Time.now)
    assert_equal "rrbg", guess.sequence
    assert Time.now <=> guess.timestamp
  end

  def test_a_code_too_long_is_invalid
    skip
    guess = Guess.new("rrrrr")
    refute guess.valid?
  end

  def test_a_code_too_short_is_invalid
    skip
    guess = Guess.new("rrr")
    refute guess.valid?
  end

  def test_a_code_with_wrong_letters_is_invalid
    skip
    guess = Guess.new("rrr%$")
    refute guess.valid_chars?
  end

  def test_a_correct_chars_and_length_is_valid
    skip
    guess = Guess.new("rbgy")
    assert guess.valid?
  end
end
