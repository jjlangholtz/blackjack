class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def ==(other)
    self.rank == other.rank && self.suit == other.suit
  end

  def rank_value
    case
    when @rank == :A
      1
    when @rank == :J
      11
    when @rank == :Q
      12
    when @rank == :K
      13
    else
      @rank
    end
  end

  def greater_than?(other)
    rank_value > other.rank_value
  end
end
