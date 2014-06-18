class CLI
  def validate_input(command)
    if command.length < 4
      puts "Your guess is too short!  Guesses must be exactly 4 characters."
    elsif command.length > 4
      puts "Your guess is too long!  Guesses must be exactly 4 characters."
    end
  end

  def instructions
    
  end

  def self.menu
    # quit, play, instructions
    puts "Intro message placeholder"
    command = ''
    while command != 'q'
      # get input and
      command = gets.chomp
      validate_input(command)

      case command
      when 'q' then puts "Goodbye.  Make this clever eventually."
      when 'p' then # new game
      when 'i' then # instructions
      end
    end
  end

  def self.run
  end
end
