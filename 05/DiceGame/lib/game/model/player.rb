module DiceGame
  class Player
    include Validator

    attr_reader :game, :name, :initial_balance
    attr_accessor :current_balance, :bet

    def initialize(game:, initial_balance:, name:)
      @game = game
      @name = name
      @initial_balance = initial_balance
      @current_balance = initial_balance
      @game.add_player(self)

      log("Player #{@name} with initial_balance #{@initial_balance}
          joined the game")
    end

    def make_bet(score:, amount:)
      @bet = Bet.new(self, score, amount)
      log("#{@name} bet #{amount} on #{score}")
    end

    def update_balance!
      @current_balance += calculate_amount
      log "#{@name}: current balance is #{@current_balance}"
    end

    def without_bet?
      @bet.nil?
    end

    def clear_bet!
      @bet = nil
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
