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
      current_guess = if role == 'breaker'
                        player_guess
                      else
                        compute_guess
                      end
      board.update(current_guess)
      board.display
      if role == 'maker'
        puts 'Standby'
        input = gets.chomp.to_i.digits.reverse
      end
      break if board.guess_correct?(current_guess)

      self.which_guess += 1
    end
  end

  def player_guess
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
    make_guesses
  end

  def compute_guess
    computer_guess = case which_guess
                     when 1
                       1111
                     end
    input = computer_guess.digits.reverse
    make_and_validate(input)
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
