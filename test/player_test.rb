require 'minitest/autorun'
require 'player'

# Class for testing player object
class PlayerTest < MiniTest::Unit::TestCase
  def setup
    @player = Player.new
  end

  def test_that_player_starts_with_100_chips
    assert_equal @player.chips, 100
  end
end
