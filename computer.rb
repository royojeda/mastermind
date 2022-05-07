class Computer
  attr_reader :nth_guess

  def initialize
    @nth_guess = 0
    @step = 0
    @list = []
  end

  def list_permutations
    [1, 2, 3, 4, 5, 6].repeated_permutation(4).to_a
  end

  def guess(board)
    self.nth_guess += 1

    if self.nth_guess == 1
      [1, 1, 2, 2]
    else
      list = list_permutations
      puts 'standby'
      gets
    end
  end

  private

  attr_writer :nth_guess, :list
end
