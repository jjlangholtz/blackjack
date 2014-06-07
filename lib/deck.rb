require "card"

class Deck
  attr_reader :size

  def initialize
    @cards = []
    @ranks = [:A, 2, 3, 4, 5, 6, 7 ,8, 9, 10, :J, :Q, :K]
    @size = 52

    build_deck
  end

  def build_deck
    add_clubs
    add_diamonds
    add_hearts
    add_spades
  end

  def add_clubs
    @ranks.each do |rank|
      @cards << Card.new(rank, :clubs)
    end
  end

  def add_diamonds
    @ranks.each do |rank|
      @cards << Card.new(rank, :diamonds)
    end
  end

  def add_hearts
    @ranks.each do |rank|
      @cards << Card.new(rank, :hearts)
    end
  end

  def add_spades
    @ranks.each do |rank|
      @cards << Card.new(rank, :spades)
    end
  end

  def draw
    if cards_left > 0
      @cards.shift
    else
      build_deck
      shuffle
      draw
    end
  end

  def cards_left
    @cards.size
  end

  def shuffle
    @cards.shuffle!
  end
end
