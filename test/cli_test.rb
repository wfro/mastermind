gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/cli'

class CLITest < Minitest::Test
  def test_it_exists
    cli = CLI.new
    assert cli
  end
end
