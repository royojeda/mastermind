class Guess
  attr_reader :value

  def initialize
    @value = []
  end

  def update_guess(value)
    self.value = value
  end

  private

  attr_writer :value
end
