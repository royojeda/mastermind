class Board
  def initialize
    @code = Array.new(4)
    @past_guesses = Array.new(12, Array.new(4, ' '))
  end

  def randomize_code
    code.map! { rand(1..6) }
  end

  def display
    system 'clear'
    puts <<-TEXT
    +-------------------+-------------------+
    | [ #{past_guesses[0][0]} | #{past_guesses[0][1]} | #{past_guesses[0][2]} | #{past_guesses[0][3]} ] | [   |   |   |   ] |
    | [ #{past_guesses[1][0]} | #{past_guesses[1][1]} | #{past_guesses[1][2]} | #{past_guesses[1][3]} ] | [   |   |   |   ] |
    | [ #{past_guesses[2][0]} | #{past_guesses[2][1]} | #{past_guesses[2][2]} | #{past_guesses[2][3]} ] | [   |   |   |   ] |
    | [ #{past_guesses[3][0]} | #{past_guesses[3][1]} | #{past_guesses[3][2]} | #{past_guesses[3][3]} ] | [   |   |   |   ] |
    | [ #{past_guesses[4][0]} | #{past_guesses[4][1]} | #{past_guesses[4][2]} | #{past_guesses[4][3]} ] | [   |   |   |   ] |
    | [ #{past_guesses[5][0]} | #{past_guesses[5][1]} | #{past_guesses[5][2]} | #{past_guesses[5][3]} ] | [   |   |   |   ] |
    | [ #{past_guesses[6][0]} | #{past_guesses[6][1]} | #{past_guesses[6][2]} | #{past_guesses[6][3]} ] | [   |   |   |   ] |
    | [ #{past_guesses[7][0]} | #{past_guesses[7][1]} | #{past_guesses[7][2]} | #{past_guesses[7][3]} ] | [   |   |   |   ] |
    | [ #{past_guesses[8][0]} | #{past_guesses[8][1]} | #{past_guesses[8][2]} | #{past_guesses[8][3]} ] | [   |   |   |   ] |
    | [ #{past_guesses[9][0]} | #{past_guesses[9][1]} | #{past_guesses[9][2]} | #{past_guesses[9][3]} ] | [   |   |   |   ] |
    | [ #{past_guesses[10][0]} | #{past_guesses[10][1]} | #{past_guesses[10][2]} | #{past_guesses[10][3]} ] | [   |   |   |   ] |
    | [ #{past_guesses[11][0]} | #{past_guesses[11][1]} | #{past_guesses[11][2]} | #{past_guesses[11][3]} ] | [   |   |   |   ] |
    +---------+-------------------+---------+

              +-------------------+
              | [ #{code[0]} | #{code[1]} | #{code[2]} | #{code[3]} ] |
              +-------------------+

    TEXT
  end

  def guess_correct?(current_guess)
    current_guess.value == code
  end

  def update(guess)
    past_guesses[guess.which - 1] = guess.value
  end

  private

  attr_accessor :code, :past_guesses
end
