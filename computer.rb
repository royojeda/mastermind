class Computer
  attr_reader :nth_guess

  def initialize
    @nth_guess = 0
  end

  def guess(board)
    self.nth_guess += 1

    if nth_guess == 1
      [1, 1, 1, 1]
    else
      find_values(board)
    end
  end

  def find_values(board)
    feedback_number = board.feedback[nth_guess - 2].reduce(0) do |total, element|
      if element == ' '
        total
      else
        total + 1
      end
    end

    previous_guess = board.past_guesses[nth_guess - 2]

    if feedback_number == 4
      arrange_pegs
    else
      previous_guess.map.with_index do |peg, index|
        if index > feedback_number - 1
          peg + 1
        else
          peg
        end
      end
    end
  end

  def arrange_pegs
    p 'Standby'
    input = gets
  end

  private

  attr_writer :nth_guess
end
