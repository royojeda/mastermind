class Board
  def initialize
    @guesses = Array.new(12, Array.new(4))
    @code = Array.new(4)
  end

  def randomize_code
    code.map! do |peg|
      peg = rand(1..6)
    end
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

  private

  attr_accessor :code
end
