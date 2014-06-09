require 'person'

# Class for making player objects
class Player < Person
  attr_accessor :chips

  def initialize
    @chips = 100
    super
  end
end
