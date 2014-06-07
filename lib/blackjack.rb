require 'player'
require 'dealer'
require 'pry'

class Blackjack
  attr_accessor :bet

  def initialize
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    puts "Welcome to Blackjack!"
    puts "*" * 20
  end

  def play
    start
    get_user_bet
    starting_hand
    show_dealer_hand
    show_player_hand
    player_move
  end

  def game_round
    show_dealer_hand
    show_player_hand
    player_move
  end

  def get_user_bet
    puts "You currently have $#{@player.chips}"
    print "How much would you like to bet? "
    @bet = gets.to_i
  end

  def player_move
    print "Do you want to (H)it, (S)tand, or (D)ouble-down? "
    input = gets.chomp.upcase
    if input == 'H'
      @player.hand.cards << @dealer.deal
      @player.hand.check_for_bust
      if @player.hand.bust == true
        puts "Oh no you have #{@player.hand.value} you busted!"
        you_lose
      end
      game_round
    elsif input == 'D'
      @bet = @bet * 2
      @player.hand.cards << @dealer.deal
      @player.hand.check_for_bust
      if @player.hand.bust == true
        puts "Oh no you have #{@player.hand.value} you busted!"
        you_lose
      end
      dealer_draws
    else
      dealer_draws
    end
  end

  def compare_to_dealer
    puts "You have #{@player.hand.value}."
    if @player.hand.value == @dealer.hand.value
      puts "The dealer has #{@dealer.hand.value}. Dealer wins!"
      you_lose
    elsif @player.hand.value < @dealer.hand.value
      puts "The dealer has #{@dealer.hand.value}. Dealer wins!"
      you_lose
    else
      puts "The dealer has #{@dealer.hand.value}. You win!"
      you_win
    end
  end

  def you_win
    puts ''
    @player.chips += @bet
    next_round
  end

  def you_lose
    puts ''
    @player.chips -= @bet
    next_round
  end

  def next_round
    discard_hands
    starting_hand
    if @player.chips <= 0
      finish_game
    else
      get_user_bet
      game_round
    end
  end

  def discard_hands
    @player.hand.cards = []
    @player.hand.bust = false
    @player.hand.ace = false
    @dealer.hand.cards = []
  end

  def starting_hand
    @dealer.deck.shuffle
    @dealer.draw
    @dealer.draw
    @player.hand.cards << @dealer.deal
    @player.hand.cards << @dealer.deal
  end

  def show_player_hand
    @player.hand.check_for_bust
    player_hand = @player.hand.to_s
    puts "Your current hand is #{player_hand}"
  end

  def show_dealer_hand
    dealer_hand = @dealer.hand.cards.first.to_s
    puts "The dealer is showing a #{dealer_hand}"
  end

  def dealer_draws
    while @dealer.hand.value < 17
      @dealer.draw
    end
    dealer_hand = @dealer.hand.to_s
    puts "The dealer's hand is #{dealer_hand}"
    if @dealer.hand.value > 21
      puts "The dealer has #{@dealer.hand.value}. Dealer busts!"
      you_win
    else
      compare_to_dealer
    end
  end

  def finish_game
 # binding.pry
    puts 'You are out of chips! Game over :('
    exit
  end
end

game = Blackjack.new
game.play
