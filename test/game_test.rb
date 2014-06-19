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
    skip
    game = Game.new
    gb = GuessBuilder.new
    game.guesses << gb.new_guess("rrbg")

    g1 = game.guesses[0]
    assert_equal 1, game.guesses.length
    assert_equal ['r', 'r', 'b', 'g'], g1.sequence
    assert Time.now <=> g1.timestamp
    assert_equal 1, game.total_turns
  end

  def test_initializes_beginner_difficulty_by_default
    game = Game.new
    assert_equal 4, answer.secret_sequence.length
  end

  def test_initializes_correct_difficulty
    skip
  end

end
