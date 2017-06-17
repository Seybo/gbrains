require_relative 'validator.rb'

module DiceGame
  class Game
    include Validator

    attr_accessor :players, :dice_result
    attr_reader :dice, :sides, :winners_percent

    def initialize(dice: 2, sides: 6, percent: 25)
      @dice = dice
      @sides = sides
      @winners_percent = percent
      @players = []

      raise @error if invalid? :game_settings

      log("Game started with #{dice.to_words.capitalize} #{sides}-sided dice")
    end

    def add_player(player)
      @players << player
    end

    def turn
      raise @error if invalid? :bets_made

      throw_dice
      show_results
      update_balance!

      clear_bets!
    end

    def finish
      @players.each do |player|
        log "#{player.name}: #{game_results_for(player)}"
      end
      nil
    end

    private

    def throw_dice
      dice_values = []
      @dice.times { dice_values << Dice.new(@sides).score }
      @dice_result = dice_result_for(dice_values)
      log "Dice throw result: #{@dice_result}"
    end

    def dice_result_for(turn)
      turn.reduce(&:+)
    end

    def show_results
      @players.each do |player|
        log "#{player.name}: #{turn_results_for(player)}"
      end
    end

    def update_balance!
      @players.each(&:update_balance!)
    end

    def clear_bets!
      @players.each(&:clear_bet!)
    end

    def turn_results_for(player)
      player.bet.score == @dice_result ? 'won' : 'lost'
    end

    def game_results_for(player)
      difference = player.current_balance - player.initial_balance
      difference > 0 ? "won #{difference}" : "lost #{difference}"
    end
  end
end
