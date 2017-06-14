require_relative 'game'
require 'minitest/autorun'

class Game < Minitest::Test
  def setup
    @game = Dice::Game.new
  end

  def test_default_setup
    assert_equal @game.cubes, 2
    assert_equal @game.sides, 6
    assert_equal @game.winners_percent, 25
  end
end
