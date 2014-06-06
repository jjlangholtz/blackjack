require 'player'
require 'dealer'

class Blackjack
  attr_accessor :bet

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @won = false
  end

  def start
    puts "Welcome to Blackjack!"
    puts "*" * 20
  end

  def play
    start
    starting_hand
    show_current_hand
    get_hit_or_stand
    get_user_bet
  end

  def game_round
    show_current_hand
    get_hit_or_stand
    get_user_bet
  end

  def get_user_bet
    puts "You currently have $#{@player.chips}"
    print "How much would you like to bet? "
    @bet = gets.to_i
  end

  def get_hit_or_stand
    print "Do you want to (H)it or (S)tand? "
    input = gets.chomp
    if input == 'H'
      @player.hand.cards << @dealer.deal
      game_round
    else
      compare_to_dealer
    end
  end

  def compare_to_dealer
    if @player.hand.hand_value == @dealer.hand.hand_value
      puts "The dealer had #{@dealer.hand.hand_value}. Dealer wins!"
    elsif @player.hand.hand_value < @dealer.hand.hand_value
      puts "The dealer had #{@dealer.hand.hand_value}. Dealer wins!"
    else
      puts "The dealer had #{@dealer.hand.hand_value}. You win!"
    end
  end

  def starting_hand
    @dealer.deck.shuffle
    @dealer.draw
    @dealer.draw
    @player.hand.cards << @dealer.deal
    @player.hand.cards << @dealer.deal
  end

  def show_current_hand
    current_hand = @player.hand.hand_value
    puts "Your current hand is #{current_hand}"
  end
end

game = Blackjack.new
game.play
