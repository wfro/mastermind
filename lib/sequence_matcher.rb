# Incorrect initially, correct_content and correct_position return integers
# reflecting the number of matches, not the matches themselves
#
# Implement as cheat codes maybe?

# def correct_content
#   @full_match = true if @guess == @answer
#
#   correct = []
#   @guess.map do |letter|
#     if letter.include?(@answer[0]) || letter.include?(@answer[1]) || letter.include?(@answer[2]) || letter.include?(@answer[3])
#       correct << letter if !(correct.include?(letter))
#     end
#   end
#   return 0 if correct.empty?
#   correct
# end
#
# def correct_position
#   # Returns a hash.  Items are added if value of array index(0-3) match
#   # value of guess index(0-3).
#   # Stores indeces as keys with corresponding values
#   correct = {}
#   (0..3).each do |i| # change to loop over @answer array?
#     if @guess[i] == @answer[i]
#       correct[i] = @guess[i]
#     end
#   end
#   return "No correct positions." if correct.empty?
#   correct
# end


class SequenceMatcher
  attr_reader :guess # access guess from GuessPrinter

  def initialize(guess, answer)
    # guess/answer are both passed in as objects
    @guess = guess.input
    @answer = answer.secret_sequence
    @full_match = false
  end

  def correct_content
    num_correct = 0
    correct = []
    @guess.map do |letter|
      if letter.include?(@answer[0]) || letter.include?(@answer[1]) || letter.include?(@answer[2]) || letter.include?(@answer[3])
        if !(correct.include?(letter))
          num_correct += 1
          correct << letter
        end
      end
    end
    num_correct
  end

  def correct_position
    correct = 0
    (0..3).each do |i| # use indeces to iterate (0 - 3)
      if @guess[i] == @answer[i]
        correct += 1
      end
    end
    correct
  end

  def full_match?
    # use this in game class to compare input directly after a guess?
    # if full_match? is true, run winning message
    @guess == @answer
  end

end
