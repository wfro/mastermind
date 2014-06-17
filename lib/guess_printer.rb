# SequqenceMatcher data needs to get here somehow
#   correct_content
#   correct_position
#   win?


class GuessPrinter

  def initialize(match_data)
    @match_data = match_data # reading in SequenceMatcher objects
    @correct_content = @match_data.correct_content
    @correct_position = @match_data.correct_position
    @current_guess = @match_data.guess
  end

  def print_output
    if @correct_content != 0
      puts "'#{@current_guess.join("")}' has #{@correct_content} of the correct elements with #{@correct_position} in the correct position(s)."
    else
      puts "No correct content."
    end
  end

end
