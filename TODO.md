SequenceGenerator - shuffle() won't allow for duplicate colors in the secret
sequence, i.e. rrbg or rbbg is not possible

Guess - make sure guess input is downcased before objects are created
  - GuessBuilder may be able to do this work?
      put all processing in guess builder
      Guess is a class with just state with any processing already completed

GuessBuilder? - perform validation on guess input
  - make sure guess is:
      correct length (by difficulty)
      characters, not numbers or symbols
  - if guess is incorrect, provide message and reprompt user

Build REPL - communicates with Game which interfaces with rest of program
