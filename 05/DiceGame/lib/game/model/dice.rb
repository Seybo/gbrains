module DiceGame
  class Dice
    attr_reader :score

    def initialize(sides)
      @score = rand(1..sides)
    end
  end
end
