require 'hand'

# Class for creating person objects
class Person
  attr_accessor :hand

  def initialize
    @hand = Hand.new
  end
end
