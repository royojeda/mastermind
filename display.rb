module Display
  def display_role_choice
    system 'clear'
    'Do you want to play as the code maker (1)? or the code breaker (2)?'
  end

  def display_prompt_guess
    'Enter a guess: '
  end

  def display_game_lost
    "GAME OVER! You've run out of guesses."
  end

  def display_game_won(guess)
    "CONGRATULATIONS! You've guessed #{guess.value} correctly in #{guess.which} guess/es!"
  end

  def display_invalid_guess
    'Invalid guess. Please enter numbers from 1 to 6: '
  end

  def display_prompt_code
    system 'clear'
    'Please enter a code of four digits, each ranging from 1 to 6: '
  end
end
