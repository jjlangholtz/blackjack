require 'minitest/autorun'
require 'dealer'

class DealerTest < MiniTest::Unit::TestCase
  def setup
    @dealer = Dealer.new
  end

  def test_dealer_has_a_deck
    assert @dealer.deck, Deck.new
  end

  def test_dealer_can_deal_cards
    before_draw = @dealer.deck.cards_left
    @dealer.deck.draw
    after_draw = @dealer.deck.cards_left

    assert before_draw > after_draw
  end
end
