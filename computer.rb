class Computer
  attr_reader :nth_guess, :previous_guess, :a, :b, :c, :d, :exact, :exact_index

  def initialize
    @nth_guess = 0
    @step = 0
    @previous_guess = []
    @exact = []
    @a = 0
    @b = 0
    @c = 0
    @d = 0
    @exact_index = 0
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

    self.previous_guess = board.past_guesses[nth_guess - 2]

    if feedback_number == 4
      arrange_pegs(board)
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

  def arrange_pegs(board)
    if step.zero?
      self.a = previous_guess[0]
      self.b = previous_guess[1]
      self.c = previous_guess[2]
      self.d = previous_guess[3]

      self.exact_index = nth_guess - 2
    end

    self.step += 1

    while exact_index <= self.nth_guess - 2
      x = board.feedback[exact_index].reduce(0) do |total, element|
        if element == 'P'
          total
        else
          total + 1
        end
      end

      exact.push(x)

      self.exact_index += 1
    end

    case step
    when 1
      p step_one
    when 2
      step_two
    when 3
      step_three
    when 4
      step_four
    # when 5
    #   step_five
    else
      p exact
      puts 'standby'
      gets
    end
  end

  def step_one
    case exact[0]
    when 0
      [b, a, d, c]
    when 1
      [a, c, d, b]
    when 2
      [a, b, d, c]
    end
  end

  def step_two
    case exact
    when [0, 0]
      [c, d, a, b]
    when [0, 2]
      [b, c, d, a]
    when [1, 0]
      [b, d, c, a]
    when [1, 1]
      [a, d, b, c]
    when [2, 0]
      [b, a, c, d]
    when [2, 1]
      [a, c, b, d]
    end
  end

  def step_three
    case exact
    when [0, 0, 0]
      [d, c, b, a]
    when [0, 0, 2]
      [c, d, b, a]
    when [0, 2, 0]
      [d, a, b, c]
    when [0, 2, 1]
      [b, d, a, c]
    when [1, 0, 0]
      [c, a, b, d]
    when [1, 1, 0]
      [b, c, a, d]
    when [2, 1, 0]
      [d, b, c, a]
    when [2, 1, 1]
      [a, d, c, b]
    end
  end

  def step_four

  end

  private

  attr_writer :nth_guess, :a, :b, :c, :d, :exact, :previous_guess, :exact_index
  attr_accessor :step
end
