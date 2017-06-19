require 'to_words'
require_relative 'core_ext/object.rb'
require_relative 'game/controller/gameplay.rb'
require_relative 'game/controller/validator.rb'
require_relative 'game/model/game.rb'
require_relative 'game/model/bet.rb'
require_relative 'game/model/dice.rb'
require_relative 'game/model/player.rb'

module DiceGame
  def self.run_test_game
    gameplay = Gameplay.new(dice: 3, sides: 4, percent: 25)

    p1 = gameplay.add_player(balance: 200, name: 'Helen')
    p2 = gameplay.add_player(balance: 150, name: 'Kate')

    gameplay.make_bet(player: p1, score: 6, amount: 20)
    gameplay.make_bet(player: p2, score: 5, amount: 15)

    gameplay.turn

    gameplay.make_bet(player: p1, score: 3, amount: 30)
    gameplay.make_bet(player: p2, score: 10, amount: 5)

    gameplay.turn

    gameplay.finish
  end

  run_test_game
end
