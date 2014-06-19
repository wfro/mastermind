gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/high_scores_repository'

class HighScoresRepositoryTest < Minitest::Test
  def test_it_exists
    hs = HighScoresRepository.new
    assert hs
  end

  def test_read_csv_data
    csv_data = HighScoresRepository.in('./test/fixtures')
    assert csv_data
  end
end
