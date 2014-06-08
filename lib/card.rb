# Class that creates card object
class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def ==(other)
    rank == other.rank && suit == other.suit
  end

  def rank_order
    case
    when @rank == :A then 1
    when @rank == :J then 11
    when @rank == :Q then 12
    when @rank == :K then 13
    else
      @rank
    end
  end

  def rank_value
    case
    when @rank == :A then 1
    when @rank == :J then 10
    when @rank == :Q then 10
    when @rank == :K then 10
    else
      @rank
    end
  end

  def rank_format
    @rank.to_s
  end

  def suit_format
    case
    when @suit == :clubs then 'C'
    when @suit == :hearts then 'H'
    when @suit == :diamonds then 'D'
    when @suit == :spades then 'S'
    end
  end

  def to_s
    rank_format + suit_format
  end

  def greater_than?(other)
    rank_order > other.rank_order
  end
end
