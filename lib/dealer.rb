require 'deck'
require 'hand'

class Dealer
  attr_accessor :deck, :hand

  def initialize
    @deck = Deck.new
    @hand = Hand.new
  end

  def draw
    @hand.cards << @deck.draw
  end

  def deal
    @deck.draw
  end
end
