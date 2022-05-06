require_relative 'game'
require_relative 'display'

def play_mastermind
  include Display

  system 'clear'
  role = prompt_role
  game = Game.new(role)
  game.play
end

def prompt_role
  puts display_role_choice
  input = gets.chomp.to_i
  validate_role_choice(input)
end

def validate_role_choice(input)
  case input
  when 1
    'maker'
  when 2
    'breaker'
  else
    system 'clear'
    puts display_invalid_role
    prompt_role
  end
end

play_mastermind
