require 'deck'

class Hand
  attr_accessor :bust, :value, :deck

  def initialize
    @bust = false
    @value = 0
    @deck = Deck.new
  end

  def draw
    @value += @deck.draw.rank_value
  end

  def bust?(value)
    @bust = true if value > 21
  end
end
