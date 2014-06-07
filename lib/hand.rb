require 'deck'
require 'pry'

class Hand
  attr_accessor :ace, :cards, :bust, :value

  def initialize
    @cards = []
    @bust = false
    @ace = false
    @value = 10
  end

  def check_for_bust
    if value > 21
      @bust = true
    else
      ace?
    end
  end

  def ace?
  # binding.pry
    ranks = @cards.map { |card| card.rank }
    @ace = ranks.include?(:A)
  end

  def to_s
    @cards.map { |card| card.to_s }.join(',')
  end

  def value
    ace?
    if @ace == true
      if total + 10 < 21
        @value = total + 10
      else
        @value = total
      end
    else
      total
    end
  end

  def total
    values = @cards.map { |card| card.rank_value }
    @value = values.inject(0) { |sum, item| sum + item }
  end
end
