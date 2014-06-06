require 'deck'

class Hand
  attr_accessor :cards, :bust, :value

  def initialize
    @cards = []
    @bust = false
  end

  def check_for_bust
    if hand_value > 21 then check_for_ace end
  end

  def check_for_ace
    ranks = @cards.map { |card| card.rank }
    ranks.include?(:A) ? @value -= 10 : @bust = true
  end

  def hand_value
    values = @cards.map { |card| card.rank_value }
    @value = values.inject(0) { |sum, item| sum + item }
  end
end
