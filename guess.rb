class Guess
  attr_reader :value, :which

  def initialize(value, which)
    @value = value
    @which = which
  end

  def valid?
    value.all? { |number| number.between?(1, 6) }
  end
end
