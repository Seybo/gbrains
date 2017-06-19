require_relative 'validator'

module DiceGame
  class Gameplay
    include Validator

    attr_accessor :players, :dice_values, :dice_result
    attr_reader :game

    def initialize(dice:, sides:, percent:)
      @game = Game.new(dice, sides, percent)
      @players = []
    end

    def add_player(balance:, name:)
      @players << Player.new(balance, name)
      @players.last
    end

    def make_bet(player:, score:, amount:)
      player.bet = Bet.new(score, amount)
      raise @error if invalid? :bet, game: game, player: player

      log("#{player.name} bet #{amount} on #{score}")
    end

    def turn
      raise @error if invalid? :bets_made

      throw_dice
      show_results
      update_balance!

      clear_bets!
    end

    def finish
      puts ''
      puts '======== THE END ========='
      @players.each do |player|
        log "#{player.name}: #{game_results_for(player)}"
      end
      nil
    end

    private

    def throw_dice
      dice_values = []
      game.dice.times { dice_values << Dice.new(game.sides).score }
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
      @players.each do |player|
        amount = calculate_amount_for(player)
        player.update_balance!(amount)
      end
    end

    def calculate_amount_for(player)
      win_amount = player.bet.amount * game.winners_percent.to_f / 100
      loose_amount = -player.bet.amount

      won_this_turn?(player) ? win_amount : loose_amount
    end

    def won_this_turn?(player)
      player.bet.score == @dice_result
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
