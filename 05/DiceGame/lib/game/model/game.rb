require_relative '../controller/validator.rb'

module DiceGame
  class Game
    include Validator

    attr_reader :dice, :sides, :winners_percent

    def initialize(dice, sides, percent)
      @dice = dice
      @sides = sides
      @winners_percent = percent

      raise @error if invalid? :game_settings

      log("Game started with #{dice.to_words.capitalize} #{sides}-sided dice")
    end
  end
end
