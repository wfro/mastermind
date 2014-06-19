gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/entry'

class EntryTest < Minitest::Test
  def test_it_exists
    name = 'Jeff'
    solution = 'rrbg'
    time = 20
    e = Entry.new(name, solution, time)
    assert e
    assert e.name
    assert e.solution
    assert e.time
  end
end
