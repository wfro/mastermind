gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/guess'

class GuessTest < Minitest::Test

  def test_has_attributes
    guess = Guess.new(%w(r r b g))
    puts guess.sequence
    assert_equal ['r', 'r', 'b', 'g'], guess.sequence
  end

  def test_a_code_too_long_is_invalid
    guess = Guess.new(%w(r r r r r))
    refute guess.valid?
  end

  def test_a_code_too_short_is_invalid
    guess = Guess.new([%w(r r b)])
    refute guess.valid?
  end

  def test_a_code_with_wrong_letters_is_invalid
    guess = Guess.new(%w(r r r % $))
    refute guess.valid_chars?
  end

  def test_valid_length?
    guess = Guess.new(%w(r r b g))
    assert guess.valid_length?
  end

  def test_a_correct_chars_and_length_is_valid
    guess = Guess.new(%w(r b g r))
    assert guess.valid?
  end

  def test_an_intermediate_code
    guess = Guess.new(%w(r b g r b), 'i')
    assert guess.valid?
  end

  def test_an_expert_code
    guess = Guess.new(%w(r b g r b r), 'e')
    assert guess.valid?
  end

end
