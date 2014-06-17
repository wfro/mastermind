gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/guess'

class GuessTest < Minitest::Test
  def test_new_objects_are_created
    guess = Guess.new("rrbg")
    assert_equal ['r', 'r', 'b', 'g'], guess.input
    assert Time.now <=> guess.timestamp
  end

  def test_can_print_guesses
    skip
    guess = Guess.new("rrby")
  end
end
