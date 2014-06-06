require 'minitest/autorun'
require 'hand'

class HandTest < MiniTest::Unit::TestCase
  def setup
    @hand = Hand.new
  end

  def test_starting_hand_has_a_zero_value
    assert_equal @hand.value, 0
  end

  def test_drawing_cards_adds_to_total_value
    old_value = @hand.value
    new_value = @hand.draw

    assert new_value > (old_value)
    refute old_value > (new_value)
  end

  def test_if_value_greater_than_22_busts
    twenty_two = @hand.bust?(22)
    twenty_three = @hand.bust?(23)

    assert twenty_two
    assert twenty_three
  end
end
