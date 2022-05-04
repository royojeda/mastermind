module Display
  def display_prompt_guess
    "Enter your guess: "
  end

  def display_game_lost
    "GAME OVER! You've run out of guesses."
  end

  def display_game_won(guess)
    "CONGRATULATIONS! You've guessed #{guess.value} correctly in #{guess.which} guess/es!"
  end

  def display_invalid_guess
    "Invalid guess. Please enter numbers from 1 to 6: "
  end
end
