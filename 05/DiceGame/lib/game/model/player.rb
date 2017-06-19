module DiceGame
  class Player
    include Validator

    attr_reader :name, :initial_balance
    attr_accessor :current_balance, :bet

    def initialize(initial_balance, name)
      @name = name
      @initial_balance = initial_balance
      @current_balance = initial_balance

      log("Player #{@name} with initial_balance #{@initial_balance}
          joined the game")
    end

    def update_balance!(amount)
      @current_balance += amount
      log "#{@name}: current balance is #{@current_balance}"
    end

    def without_bet?
      @bet.nil?
    end

    def clear_bet!
      @bet = nil
    end
  end
end
