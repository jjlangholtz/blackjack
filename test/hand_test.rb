require 'minitest/autorun'
require 'hand'

class HandTest < MiniTest::Unit::TestCase
  def setup
    @hand = Hand.new
  end

  def test_hand_busts_over_21
    bad_hand = Hand.new
    bad_hand.cards << Card.new(10, :clubs)
    bad_hand.cards << Card.new(10, :hearts)
    bad_hand.cards << Card.new(10, :diamonds)

    good_hand = Hand.new
    good_hand.cards << Card.new(10, :clubs)

    good_hand.check_for_bust
    bad_hand.check_for_bust

    assert bad_hand.bust
    refute good_hand.bust
  end
end
