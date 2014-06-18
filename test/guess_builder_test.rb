gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/guess_builder'
require './lib/guess'

class GuessBuilderTest < Minitest::Test
  def creates_valid_guesses
    gb = GuessBuilder.new
    assert gb.new_guess('rbgy')
  end

  def test_downcases_uppercase_input
    gb = GuessBuilder.new
    guess = gb.new_guess('RRRR')
    assert_equal %w(r r r r), guess.sequence
  end

  def test_does_not_build_invalid_input
    gb = GuessBuilder.new
    refute gb.new_guess('XXXXX')
  end
end
