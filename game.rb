require_relative 'board'
require_relative 'display'
require_relative 'guess'

class Game
  include Display

  attr_reader :board, :which_guess, :guesses

  def initialize
    @board = Board.new
    @which_guess = 7
    @guesses = Array.new(12)
  end

  def play
    board.randomize_code
    board.display
    make_guesses
    display_result
  end

  def make_guesses
    while which_guess <= 12
      current_guess = take_guess
      board.update(current_guess)
      board.display
      break if board.guess_correct?(current_guess)

      which_guess += 1
    end
  end

  def take_guess
    puts display_prompt_guess
    input = Array.new(4)
    input.map! { gets.chomp.to_i }
    guesses[which_guess - 1] = Guess.new(input, which_guess)
    return guesses[which_guess - 1] if guesses[which_guess - 1].valid?

    system 'clear'
    board.display
    puts display_invalid_guess
    take_guess
  end

  private

  attr_writer :which_guess

  def display_result
    if which_guess == 12
      puts display_game_lost
    else
      puts display_game_won(guesses[which_guess - 1])
    end
  end
end
