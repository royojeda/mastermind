class Computer
  attr_reader :nth_guess

  def initialize
    @nth_guess = 0
    @step = 0
  end

  def guess(board)
    list_permutations
  end

  def list_permutations
    list = [1, 2, 3, 4, 5, 6].repeated_permutation(4).to_a

    i = 0
    while i < list.length
      p list[i]
      i += 1
    end
    gets
  end
end
