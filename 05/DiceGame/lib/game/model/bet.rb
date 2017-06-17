module DiceGame
  class Bet
    include Validator

    attr_reader :player, :score, :amount

    def initialize(player, score, amount)
      @player = player
      @score = score
      @amount = amount

      raise @error if invalid? :bet
    end
  end
end
