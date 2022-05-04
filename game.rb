require_relative 'board'

class Game
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def play
    board.randomize_code
    board.display
  end
end
