require 'deck'

# Class for creating hand objects
class Hand
  include Enumerable

  attr_accessor :ace, :cards, :bust, :value

  def initialize
    @cards = []
    @bust = false
    @ace = false
    @value = 10
  end

  def each
    @cards.each do |card|
      yield card
    end
  end

  def check_for_bust
    if value > 21
      @bust = true
    else
      check_for_ace
    end
  end

  def check_for_ace
    ranks = map { |card| card.rank }
    @ace = ranks.include?(:A)
  end

  def to_s
    map { |card| card.to_s }.join(',')
  end

  def value
    check_for_ace
    if @ace == true
      if total + 10 < 22
        @value = total + 10
      else
        @value = total
      end
    else
      total
    end
  end

  def total
    values = map { |card| card.rank_value }
    @value = values.reduce(0, :+)
  end
end
