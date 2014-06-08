require 'minitest/autorun'
require 'hand'

# Class for testing hand objects
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

  def test_ace_is_11_unless_hand_busts
    sample_hand = Hand.new
    sample_hand.cards << Card.new(:A, :clubs)

    another_hand = Hand.new
    another_hand.cards << Card.new(:A, :clubs)
    another_hand.cards << Card.new(:J, :clubs)
    another_hand.cards << Card.new(:Q, :clubs)

    assert_equal 11, sample_hand.value
    assert_equal 21, another_hand.value
  end

  def test_aces_handle_correctly
    hand_of_aces = Hand.new
    hand_of_aces.cards << Card.new(:A, :clubs)
    hand_of_aces.cards << Card.new(:A, :diamonds)
    hand_of_aces.cards << Card.new(:A, :spades)
    hand_of_aces.cards << Card.new(:A, :hearts)

    assert_equal 14, hand_of_aces.value
  end
end
