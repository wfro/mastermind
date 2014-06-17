gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/guess_builder'
require './lib/guess'

class GuessBuilderTest < Minitest::Test
  def test_new_guess_returns_guess_objects
    gb = GuessBuilder.new('rrbg')
    assert_equal Guess, gb.new_guess.class
  end
end
