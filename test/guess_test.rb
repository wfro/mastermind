gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/guess'

class GuessTest < Minitest::Test
  def test_has_attributes
    guess = Guess.new("rrbg", Time.now, 0)
    assert_equal 'rrbg', guess.input
    assert Time.now <=> guess.timestamp
    assert_equal 0, guess.turn
  end

  def test_can_print_guesses
    skip
    guess = Guess.new("rrby")
  end
end
