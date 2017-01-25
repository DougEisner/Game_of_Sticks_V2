require_relative 'game'

def main
  game = Game.new(10)
  game.play
end

main if __File__ = $PROGRAM_NAME
