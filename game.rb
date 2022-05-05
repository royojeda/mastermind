require_relative 'board'
require_relative 'display'
require_relative 'guess'

class Game
  include Display

  attr_reader :board, :which_guess, :guesses, :role

  def initialize(role)
    @board = Board.new
    @which_guess = 1
    @guesses = Array.new(12)
    @role = role
  end

  def play
    if role == 'breaker'
      play_breaker
    else
      play_maker
    end
    announce_result
  end

  def play_breaker
    board.randomize_code
    board.display
    make_guesses
  end

  def play_maker
    puts display_prompt_code
    input = gets.chomp.to_i.digits.reverse
    board.change_code(input)
    board.display
    get_computer_guesses
  end

  def make_guesses
    while which_guess <= 12
      current_guess = take_guess
      board.update(current_guess)
      board.display
      break if board.guess_correct?(current_guess)

      self.which_guess += 1
    end
  end

  def take_guess
    puts display_prompt_guess
    input = gets.chomp.to_i.digits.reverse
    make_and_validate(input)
  end

  def make_and_validate(input)
    guesses[which_guess - 1] = Guess.new(input, which_guess)
    return guesses[which_guess - 1] if guesses[which_guess - 1].valid?

    system 'clear'
    board.display
    puts display_invalid_guess
    take_guess
  end

  def get_computer_guesses

  end

  private

  attr_writer :which_guess

  def announce_result
    if which_guess == 13
      puts display_game_lost
    else
      puts display_game_won(guesses[which_guess - 1])
    end
  end
end
