gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/guess_printer'
require './lib/sequence_matcher'
require './lib/guess_builder'
require './lib/sequence_generator'


class GuessPrinterTest < Minitest::Test

  def test_it_exists
    match_data = SequenceMatcher.new(GuessBuilder.new.new_guess('rrbg'), SequenceGenerator.new.random_sequence)
    guess_printer = GuessPrinter.new(match_data)
    assert guess_printer
  end

  def test_prints_correct_content
    match_data = SequenceMatcher.new(GuessBuilder.new.new_guess('rrbg'), SequenceGenerator.new.random_sequence)
    guess_printer = GuessPrinter.new(match_data)
    guess_printer.print_output
  end

  def test_prints_no_correct_content
    # how to make this work?  Issues with puts in method and return values
    skip
    match_data = SequenceMatcher.new(GuessBuilder.new.new_guess('zzzz'), SequenceGenerator.new.random_sequence)
    guess_printer = GuessPrinter.new(match_data)

    assert_equal "No correct content.", guess_printer.print_output
  end

end
