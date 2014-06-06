class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def ==(other)
    self.rank == other.rank && self.suit == other.suit
  end

  def rank_order
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

  def rank_value
    case
    when @rank == :A
      11
    when @rank == :J
      10
    when @rank == :Q
      10
    when @rank == :K
      10
    else
      @rank
    end
  end

  def rank_format
    @rank.to_s
  end

  def suit_format
    case
    when @suit == :clubs
      "C"
    when @suit == :hearts
      "H"
    when @suit == :diamonds
      "D"
    when @suit == :spades
      "S"
    end
  end

  def greater_than?(other)
    rank_order > other.rank_order
  end
end
