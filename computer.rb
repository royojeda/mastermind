class Computer
  def initialize
    @first_guess = true
  end

  def guess
    if first_guess
      self.first_guess = false
      1111
    else
      next_guess
    end.digits.reverse
  end

  def next_guess
    2222
  end

  private

  attr_accessor :first_guess
end
