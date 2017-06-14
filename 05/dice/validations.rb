module Dice
  module Validator
    attr_reader :error

    def valid?(*args)
      clear_error!

      args.each do |validator_name|
        send "check_#{validator_name}"
      end

      @error.nil? ? true : false
    end

    def clear_error!
      @error = nil
    end

    def check_bets_made
      puts 'Validating bets have been made...'

      @error = 'No players :(' if players.empty?

      @players.each do |player|
        @error = 'Not all the players have bets' if player.without_bet?
      end
    end

    def check_bet
      puts 'Validating bet...'
      @error = 'Not enough credits' if current_balance < @bet_amount
      @error = 'Wrong bet amount' if @bet_amount <= 0
      @error = 'Wrong score' unless (game.cubes..game.cubes * game.sides).cover? @bet_score
    end
  end
end
