require 'player'
require 'dealer'
require 'pry'

# Class that creates blackjack objects
class Blackjack
  attr_accessor :bet

  def initialize
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    puts 'Welcome to Blackjack!'
    puts '*' * 20
    @dealer.deck.shuffle
  end

  def play
    start
    bet_amount
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

  def bet_amount
    puts "You currently have $#{@player.chips}"
    print 'How much would you like to bet? '
    @bet = gets.to_i
    if @bet > @player.chips && @bet > 0
      puts "You don't have enough chips!"
      bet_amount
    end
  end

  def player_move
    player_choice
    if @input == 'H'
      player_bust_check
      game_round
    elsif @input == 'D'
      double_down
    else
      dealer_draws
    end
  end

  def player_choice
    print 'Do you want to (H)it, (S)tand, or (D)ouble-down? '
    @input = gets.chomp.upcase
  end

  def double_down
    @bet *= 2
    if @bet > @player.chips
      puts "You don't have enough chips"
      @bet /= 2
      player_move
    else
      player_bust_check
      dealer_draws
    end
  end

  def player_bust_check
    @player.hand.cards << @dealer.deal
    @player.hand.check_for_bust
    return unless @player.hand.bust == true
    puts "Oh no you have #{@player.hand.value} you busted!"
    you_lose
  end

  def compare_to_dealer
    puts "You have #{@player.hand.value}."
    if @player.hand.value < @dealer.hand.value
      puts "The dealer has #{@dealer.hand.value}. Dealer wins!"
      you_lose
    elsif @player.hand.value == @dealer.hand.value
      puts 'Standoff! You get to keep your bet'
      standoff
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

  def standoff
    puts ''
    next_round
  end

  def next_round
    discard_hands
    starting_hand
    if @player.chips <= 0
      finish_game
    else
      bet_amount
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
    @dealer.draw while @dealer.hand.value < 17
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
    puts 'You are out of chips! Game over :('
    exit
  end
end

game = Blackjack.new
game.play
