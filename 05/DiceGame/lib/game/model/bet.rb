module DiceGame
  class Bet
    include Validator

    attr_reader :score, :amount

    def initialize(score, amount)
      @score = score
      @amount = amount
    end
  end
end
