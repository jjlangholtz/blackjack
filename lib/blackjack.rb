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
    get_user_bet
    starting_hand
    show_current_hand
    get_hit_or_stand
  end

  def game_round
    show_current_hand
    get_hit_or_stand
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
      @player.hand.check_for_bust
      if @player.hand.bust == true
        puts "Oh no you have #{@player.hand.hand_value} you busted!"
        you_lose
      end
      game_round
    else
      compare_to_dealer
    end
  end

  def compare_to_dealer
    if @player.hand.hand_value == @dealer.hand.hand_value
      puts "The dealer had #{@dealer.hand.hand_value}. Dealer wins!"
      you_lose
    elsif @player.hand.hand_value < @dealer.hand.hand_value
      puts "The dealer had #{@dealer.hand.hand_value}. Dealer wins!"
      you_lose
    else
      puts "The dealer had #{@dealer.hand.hand_value}. You win!"
      you_win
    end
  end

  def you_win
    @player.chips += @bet
    next_round
  end

  def you_lose
    @player.chips -= @bet
    finish_game if @player.chips <= 0
    next_round
  end

  def next_round
    discard_hands
    starting_hand
    get_user_bet
    game_round
  end

  def discard_hands
    @player.hand.cards = []
    @player.hand.bust = false
    @dealer.hand.cards = []
  end

  def starting_hand
    @dealer.deck.shuffle
    @dealer.draw
    @dealer.draw
    @player.hand.cards << @dealer.deal
    @player.hand.cards << @dealer.deal
  end

  def show_current_hand
    @player.hand.check_for_bust
    current_hand = @player.hand.to_s
    puts "Your current hand is #{current_hand}"
  end

  def finish_game
    puts 'You are out of chips! Game over :('
  end
end

game = Blackjack.new
game.play
