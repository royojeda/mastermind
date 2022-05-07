class Computer
  def initialize
    @nth_guess = 0
    @step = 0
    @list = list_permutations
  end

  def list_permutations
    [1, 2, 3, 4, 5, 6].repeated_permutation(4).to_a
  end

  def guess(board)
  end
end
