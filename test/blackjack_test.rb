require 'minitest/autorun'
require 'blackjack'

class BlackjackTest < MiniTest::Unit::TestCase
  def setup
    @game = Blackjack.new
  end
end
