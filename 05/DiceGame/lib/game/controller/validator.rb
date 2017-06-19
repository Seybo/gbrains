module DiceGame
  module Validator
    attr_reader :error

    private

    def invalid?(validator, params = {})
      clear_error!

      if params.empty?
        send "check_#{validator}"
      else
        send "check_#{validator}", params
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

    def check_bet(params)
      g = params[:game]
      p = params[:player]

      @error = 'Not enough credits' if p.current_balance < p.bet.amount
      @error = 'Wrong bet amount' if p.bet.amount <= 0
      @error = 'Wrong score' unless (g.dice..g.dice * g.sides).cover? p.bet.score
    end
  end
end
