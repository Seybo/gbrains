module Dice
  class Throw
    attr_accessor :score

    def initialize(cubes, sides)
      @score = 0
      cubes.times do
        @score += rand(sides - 1) + 1
      end
    end
  end
end
