gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/cli'

class CLITest < Minitest::Test
  def test_it_exists
    cli = CLI.new
    assert cli
  end

  def test_it_validates_input
    # how to test printing to console?
    cli = CLI.new
    too_short = 'rrb'
    too_long = 'rrrrrrrrr'
    assert_equal "Your guess is too short!  Guesses must be exactly 4 characters.", cli.validate_input(too_short)
    assert_equal "Your guess is too long!  Guesses must be exactly 4 characters.", cli.validate_input(too_long)
  end
end
