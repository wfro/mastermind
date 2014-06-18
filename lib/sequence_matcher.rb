class SequenceMatcher
  attr_reader :guess # access guess from GuessPrinter

  def initialize(guess, answer)
    # guess/answer are both passed in as objects
    @guess = guess.sequence
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
