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
    gb = GuessBuilder.new
    game.guesses << gb.new_guess("rrbg")

    assert_equal 1, game.guesses.length
  end

  def test_initializes_beginner_difficulty_by_default
    # issues with exposing  answer from Game?
    skip
    game = Game.new
    assert_equal 4, answer.secret_sequence.length
  end

  def test_history_exists
    game = Game.new
    game.history
  end


  # figure out how to test cosole output
  # def test_history_prints_guess_history
  #   game = Game.new
  #   game.history
  # end

end
