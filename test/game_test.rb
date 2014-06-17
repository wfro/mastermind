gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/game'
require './lib/guess'

class GameTest < Minitest::Test

  def test_new_game_has_no_guesses
    game = Game.new
    assert_equal 0, game.guesses.length
  end

  def test_add_new_guess
    game = Game.new
    guess = Guess.new("rrbg")
    game << guess

    g1 = game.guesses[0]
    assert_equal 1, game.guesses.length
    assert_equal ['r', 'r', 'b', 'g'], g1.input
  end

  def test_start_new_game
    
  end

end
