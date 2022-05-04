class Board
  def initialize
    @code = Array.new(4)
  end

  def randomize_code
    code.map! { |peg| peg = rand(1..6) }
  end

  def display
    system 'clear'
    puts <<-TEXT
    +-------------------+-------------------+
    | [   |   |   |   ] | [   |   |   |   ] |
    | [   |   |   |   ] | [   |   |   |   ] |
    | [   |   |   |   ] | [   |   |   |   ] |
    | [   |   |   |   ] | [   |   |   |   ] |
    | [   |   |   |   ] | [   |   |   |   ] |
    | [   |   |   |   ] | [   |   |   |   ] |
    | [   |   |   |   ] | [   |   |   |   ] |
    | [   |   |   |   ] | [   |   |   |   ] |
    | [   |   |   |   ] | [   |   |   |   ] |
    | [   |   |   |   ] | [   |   |   |   ] |
    | [   |   |   |   ] | [   |   |   |   ] |
    | [   |   |   |   ] | [   |   |   |   ] |
    +---------+-------------------+---------+
              | [ #{code[0]} | #{code[1]} | #{code[2]} | #{code[3]} ] |
              +-------------------+
    TEXT
  end

  def guess_correct?(current_guess)
    current_guess.value == code
  end

  private

  attr_accessor :code
end
