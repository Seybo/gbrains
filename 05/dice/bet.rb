module Dice
  class Bet
    attr_accessor :score, :amount

    def initialize(score, amount)
      @score = score
      @amount = amount
    end
  end
end
