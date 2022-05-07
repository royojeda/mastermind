class Board
  attr_reader :past_guesses, :feedback, :shown_code

  def initialize
    @code = Array.new(4)
    @shown_code = ['*', '*', '*', '*']
    @past_guesses = []
    12.times { past_guesses.push([' ', ' ', ' ', ' ']) }
    @feedback = []
    12.times { feedback.push([' ', ' ', ' ', ' ']) }
  end

  def display
    system 'clear'
    puts <<-TEXT

    +-------------------+-------------------+
    | [ #{past_guesses[0][0]} | #{past_guesses[0][1]} | #{past_guesses[0][2]} | #{past_guesses[0][3]} ] | [ #{feedback[0][0]} | #{feedback[0][1]} | #{feedback[0][2]} | #{feedback[0][3]} ] |
    | [ #{past_guesses[1][0]} | #{past_guesses[1][1]} | #{past_guesses[1][2]} | #{past_guesses[1][3]} ] | [ #{feedback[1][0]} | #{feedback[1][1]} | #{feedback[1][2]} | #{feedback[1][3]} ] |
    | [ #{past_guesses[2][0]} | #{past_guesses[2][1]} | #{past_guesses[2][2]} | #{past_guesses[2][3]} ] | [ #{feedback[2][0]} | #{feedback[2][1]} | #{feedback[2][2]} | #{feedback[2][3]} ] |
    | [ #{past_guesses[3][0]} | #{past_guesses[3][1]} | #{past_guesses[3][2]} | #{past_guesses[3][3]} ] | [ #{feedback[3][0]} | #{feedback[3][1]} | #{feedback[3][2]} | #{feedback[3][3]} ] |
    | [ #{past_guesses[4][0]} | #{past_guesses[4][1]} | #{past_guesses[4][2]} | #{past_guesses[4][3]} ] | [ #{feedback[4][0]} | #{feedback[4][1]} | #{feedback[4][2]} | #{feedback[4][3]} ] |
    | [ #{past_guesses[5][0]} | #{past_guesses[5][1]} | #{past_guesses[5][2]} | #{past_guesses[5][3]} ] | [ #{feedback[5][0]} | #{feedback[5][1]} | #{feedback[5][2]} | #{feedback[5][3]} ] |
    | [ #{past_guesses[6][0]} | #{past_guesses[6][1]} | #{past_guesses[6][2]} | #{past_guesses[6][3]} ] | [ #{feedback[6][0]} | #{feedback[6][1]} | #{feedback[6][2]} | #{feedback[6][3]} ] |
    | [ #{past_guesses[7][0]} | #{past_guesses[7][1]} | #{past_guesses[7][2]} | #{past_guesses[7][3]} ] | [ #{feedback[7][0]} | #{feedback[7][1]} | #{feedback[7][2]} | #{feedback[7][3]} ] |
    | [ #{past_guesses[8][0]} | #{past_guesses[8][1]} | #{past_guesses[8][2]} | #{past_guesses[8][3]} ] | [ #{feedback[8][0]} | #{feedback[8][1]} | #{feedback[8][2]} | #{feedback[8][3]} ] |
    | [ #{past_guesses[9][0]} | #{past_guesses[9][1]} | #{past_guesses[9][2]} | #{past_guesses[9][3]} ] | [ #{feedback[9][0]} | #{feedback[9][1]} | #{feedback[9][2]} | #{feedback[9][3]} ] |
    | [ #{past_guesses[10][0]} | #{past_guesses[10][1]} | #{past_guesses[10][2]} | #{past_guesses[10][3]} ] | [ #{feedback[10][0]} | #{feedback[10][1]} | #{feedback[10][2]} | #{feedback[10][3]} ] |
    | [ #{past_guesses[11][0]} | #{past_guesses[11][1]} | #{past_guesses[11][2]} | #{past_guesses[11][3]} ] | [ #{feedback[11][0]} | #{feedback[11][1]} | #{feedback[11][2]} | #{feedback[11][3]} ] |
    +-------------------+-------------------+

              +-------------------+
              | [ #{shown_code[0]} | #{shown_code[1]} | #{shown_code[2]} | #{shown_code[3]} ] |
              +-------------------+

    TEXT
  end

  def reveal_code
    self.shown_code = code.clone
  end

  def guess_correct?(guess)
    guess.value == code
  end

  def check_matches(guess)
    guess.value.each_with_index.reduce(0) do |total, (peg, index)|
      peg == code[index] ? (total + 1) : total
    end
  end

  def check_includes(guess)
    code_copy = code.map(&:clone)

    guess.value.each do |peg|
      code_copy.each_with_index do |value, i|
        if peg == value
          code_copy.delete_at(i)
          break
        end
      end
    end

    code.length - code_copy.length
  end

  def update_feedback(exact, partial, which_guess)
    i = 0
    until i == exact
      feedback[which_guess - 1][i] = 'X'
      i += 1
    end

    until i == exact + partial
      feedback[which_guess - 1][i] = 'P'
      i += 1
    end
  end

  def update(guess, which_guess)
    exact_matches = check_matches(guess)
    partial_matches = check_includes(guess) - exact_matches
    update_feedback(exact_matches, partial_matches, which_guess)
    past_guesses[which_guess - 1] = guess.value
    display
  end

  def change_code(input)
    self.code = input
  end

  private

  attr_accessor :code
  attr_writer :past_guesses, :feedback, :shown_code
end
