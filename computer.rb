class Computer
  attr_reader :nth_guess, :list, :current_guess

  def initialize
    @nth_guess = 0
    @step = 0
    @list = [1, 2, 3, 4, 5, 6].repeated_permutation(4).to_a
    @current_guess = [1, 1, 2, 2]
  end

  def guess(board)
    sleep(1.25)
    self.nth_guess += 1

    if self.nth_guess != 1
      x_real = board.feedback[nth_guess - 2].reduce(0) do |total, peg|
        peg == 'X' ? total + 1 : total
      end

      p_real = board.feedback[nth_guess - 2].reduce(0) do |total, peg|
        peg == 'P' ? total + 1 : total
      end

      list.select! do |possible_code|
        x_count = board.check_matches(current_guess, possible_code)
        p_count = board.check_includes(current_guess, possible_code) - x_count
        x_count == x_real && p_count == p_real
      end

      self.current_guess = list[rand(0..(list.length - 1))]
    end
    current_guess
  end

  private

  attr_writer :nth_guess, :list, :current_guess
end
