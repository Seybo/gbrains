require_relative 'bet'
require_relative 'validations'

module Dice
  class Player
    include Validator

    attr_accessor :game, :name, :initial_balance, :current_balance, :bet

    def initialize(game, initial_balance = 100, name = '')
      @game = game
      @name = name
      @initial_balance = initial_balance
      @current_balance = initial_balance
      @game.add_player(self)
    end

    def make_bet(score: bet_score, amount: bet_amount)
      @bet_amount = amount
      @bet_score = score
      return @error unless valid? :bet
      @bet = Bet.new(score, amount)
    end

    def update_balance!
      @current_balance += calculate_amount
      puts "#{name}: current balance is #{@current_balance}"
    end

    def without_bet?
      @bet.nil?
    end

    private

    def calculate_amount
      winner_amount = @bet.amount * @game.winners_percent.to_f / 100
      won_this_turn? ? winner_amount : -@bet.amount
    end

    def won_this_turn?
      @bet.score == @game.dice_result
    end
  end
end
