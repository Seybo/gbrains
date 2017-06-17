module DiceGame
  module Validator
    attr_reader :error

    private

    def invalid?(*args)
      clear_error!

      args.each do |validator_name|
        send "check_#{validator_name}"
      end

      @error.nil? ? false : true
    end

    def clear_error!
      @error = nil
    end

    def check_game_settings
      @error = 'Incorrect game settings' if @dice <= 0 ||
                                            @sides <= 0 ||
                                            @winners_percent <= 0
    end

    def check_bets_made
      @error = 'No players :(' if players.empty?

      @players.each do |player|
        @error = 'Not all the players made bets' if player.without_bet?
      end
    end

    def check_bet
      @error = 'Not enough credits' if @player.current_balance < @amount
      @error = 'Wrong bet amount' if @amount <= 0
      @error = 'Wrong score' unless
        (game.dice..game.dice * game.sides).cover? @score
    end

    private

    def game
      @player.game
    end
  end
end
