# Class for making player objects
class Player
  attr_accessor :chips, :hand

  def initialize
    @chips = 100
    @hand = Hand.new
  end
end
