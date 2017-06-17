require 'to_words'
require_relative 'core_ext/object.rb'
require_relative 'game/controller/game.rb'
require_relative 'game/controller/validator.rb'
require_relative 'game/model/bet.rb'
require_relative 'game/model/dice.rb'
require_relative 'game/model/player.rb'

module DiceGame
  def self.run_test_game
    gm = Game.new(dice: 3, sides: 4)

    p1 = Player.new(game: gm, initial_balance: 200, name: 'Helen')
    p2 = Player.new(game: gm, initial_balance: 150, name: 'Kate')

    p1.make_bet(score: 6, amount: 20)
    p2.make_bet(score: 5, amount: 15)

    gm.turn

    p1.make_bet(score: 3, amount: 30)
    p2.make_bet(score: 10, amount: 5)

    gm.turn

    gm.finish
  end

  run_test_game
end
