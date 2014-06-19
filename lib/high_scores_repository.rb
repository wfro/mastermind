# Handles reading csv data and printing

require 'csv'
require './lib/entry'

class HighScoresRepository

  attr_reader :rows

  def self.in(dir)
    file = File.join(dir, 'high_scores.csv')
    data = CSV.open(file, headers: true, header_converters: :symbol)
    rows = data.map do |row|
      Entry.new(row)
    end
    puts rows
    new(rows)
  end

end
