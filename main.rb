require_relative 'game'
require_relative 'display'

def play_mastermind
  include Display

  puts display_role_choice
  input = gets.chomp.to_i
  role = input == 1 ? 'maker' : 'breaker'
  game = Game.new(role)
  game.play
end

play_mastermind
