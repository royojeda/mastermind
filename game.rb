require_relative 'board'
require_relative 'display'
require_relative 'guess'
require_relative 'computer'

class Game
  include Display

  attr_reader :board, :which_guess, :role, :guess, :computer

  def initialize(role)
    @board = Board.new
    @guess = Guess.new
    @which_guess = 1
    @role = role
  end

  def play
    system 'clear'
    input = if role == 'breaker'
              setup_breaker
            else
              setup_maker
            end
    board.change_code(input)
    board.reveal_code if role == 'maker'
    board.display
    make_guesses
    announce_result
  end

  def setup_breaker
    Array.new(4).map { rand(1..6) }
  end

  def setup_maker
    @computer = Computer.new
    puts display_prompt_code
    input = gets.chomp.to_i.digits.reverse
  end

  def make_guesses
    while which_guess <= 12
      input = if role == 'breaker'
                player_guess
              else
                computer.guess(board)
              end
      guess.update_guess(input)
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

  def make_and_validate(input)
    return input if input.all? { |number| number.between?(1, 6) }

    board.display
    puts display_invalid_guess
    make_guesses
  end

  private

  attr_writer :which_guess, :guess

  def announce_result
    if role == 'breaker'
      board.reveal_code
      if which_guess <= 12
        puts display_game_won(self)
      else
        puts display_game_lost
      end
    else
      puts display_computer_won(self)
    end
  end
end
