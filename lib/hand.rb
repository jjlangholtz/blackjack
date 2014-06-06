require 'deck'
require 'pry'

class Hand
  attr_accessor :cards, :bust, :value

  def initialize
    @cards = []
    @bust = false
  end

  def check_for_bust
    if hand_value > 21
      @bust = true
    else
      check_for_ace
    end
  end

  def check_for_ace
    ranks = @cards.map { |card| card.rank.to_s }
    @value += 10 if ranks.include?('A')
  end

  def to_s
    @cards.map { |card| card.to_s }.join(',')
  end

  def hand_value
    values = @cards.map { |card| card.rank_value }
    @value = values.inject(0) { |sum, item| sum + item }
  end
end
