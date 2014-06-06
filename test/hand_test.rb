require 'minitest/autorun'
require 'hand'

class HandTest < MiniTest::Unit::TestCase
  def setup
    @hand = Hand.new
  end

  def test_that_draw_puts_next_card_in_hand
    cards_in_hand = []
    cards_in_hand << Card.new(:A, :clubs)
    @hand.draw

    assert_equal @hand.cards, cards_in_hand
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

  def test_ace_will_be_11_unless_it_will_bust
    high_ace = Hand.new
    high_ace.cards << Card.new(10, :clubs)
    high_ace.cards << Card.new(:A, :clubs)

    low_ace = Hand.new
    low_ace.cards << Card.new(:A, :clubs)
    low_ace.cards << Card.new(:A, :diamonds)

    high_ace.check_for_bust
    low_ace.check_for_bust

    assert_equal 21, high_ace.value
    assert_equal 12, low_ace.value
  end
end
