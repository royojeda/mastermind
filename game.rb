require_relative 'board'
require_relative 'display'
require_relative 'guess'

class Game
  include Display

  attr_reader :board, :which_guess, :role, :guess

  def initialize(role)
    @board = Board.new
    @which_guess = 1
    @guess = Guess.new
    @role = role
  end

  def play
    input = if role == 'breaker'
              setup_breaker
            else
              setup_maker
            end
    board.change_code(input)
    board.display
    make_guesses
    announce_result
  end

  def setup_breaker
    Array.new(4).map { rand(1..6) }
  end

  def setup_maker
    puts display_prompt_code
    gets.chomp.to_i.digits.reverse
  end

  def make_guesses
    while which_guess <= 12
      if role == 'breaker'
        player_guess
      else
        compute_guess
      end
      board.update(guess, which_guess)
      break if board.guess_correct?(guess)

      self.which_guess += 1
    end
  end

  def player_guess
    puts display_prompt_guess
    input = gets.chomp.to_i.digits.reverse
    make_and_validate(input)
  end

  def compute_guess
    computer_guess = case which_guess
                     when 1
                       1111
                     end.digits.reverse
    guess.update_guess(computer_guess)
  end

  def make_and_validate(input)
    if input.all? { |number| number.between?(1, 6) }
      guess.update_guess(input)
    else
      board.display
      puts display_invalid_guess
      make_guesses
    end
  end

  private

  attr_writer :which_guess, :guess

  def announce_result
    if which_guess <= 12
      puts display_game_won(self, guess)
    else
      puts display_game_lost
    end
  end
end
