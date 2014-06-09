require 'person'
require 'deck'

# Class that creates dealer objects
class Dealer < Person
  attr_accessor :deck

  def initialize
    @deck = Deck.new
    super
  end

  def draw
    @hand.cards << @deck.draw
  end

  def deal
    @deck.draw
  end
end
