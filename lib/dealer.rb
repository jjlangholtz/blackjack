require 'deck'

class Dealer
  attr_accessor :deck

  def initialize
    @deck = Deck.new
  end
end
