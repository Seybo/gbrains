require_relative 'player.rb'
require_relative 'die.rb'
require_relative 'validations.rb'

module Dice
  class Game
    include Validator

    attr_accessor :cubes, :sides, :players, :dice_result
    attr_reader :winners_percent

    def initialize(cubes = 2, sides = 6, winners_percent = 25)
      @cubes = cubes
      @sides = sides
      @winners_percent = winners_percent
      @players = []
    end

    def add_player(player)
      @players << player
    end

    def turn
      return @error unless valid? :bets_made

      throw_dice
      show_results
      update_balance!

      clear_bets!
    end

    def finish
      @players.each do |player|
        puts "#{player.name}: #{game_results_for(player)}"
      end
      nil
    end

    private

    def throw_dice
      @dice_result = Dice::Throw.new(@cubes, @sides).score
    end

    def show_results
      puts "Dice throw result: #{@dice_result}"
      @players.each do |player|
        puts "#{player.name}: #{turn_results_for(player)}"
      end
      nil
    end

    def update_balance!
      @players.each(&:update_balance!)
    end

    def clear_bets!
      @players.each do |player|
        player.bet = nil
      end
      nil
    end

    def turn_results_for(player)
      player.bet.score == @dice_result ? 'win' : 'loose'
    end

    def game_results_for(player)
      difference = player.current_balance - player.initial_balance
      difference > 0 ? "won #{difference}" : "lost #{difference}"
    end
  end
end
