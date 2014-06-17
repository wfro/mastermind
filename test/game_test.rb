gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/game'
require './lib/guess'
require './lib/guess_builder'

class GameTest < Minitest::Test

  def test_new_game_has_no_guesses
    game = Game.new
    assert_equal 0, game.guesses.length
  end

  def test_add_new_guess
    game = Game.new
    guess = GuessBuilder.new("rrbg")
    game << guess.new_guess

    g1 = game.guesses[0]
    puts g1.class
    assert_equal 1, game.guesses.length
    assert_equal ['r', 'r', 'b', 'g'], g1.input
    assert Time.now <=> g1.timestamp
    assert_equal 0, g1.turn
  end

  def test_add_another_guess
    skip
  end

  def test_start_new_game
    skip
  end

end
