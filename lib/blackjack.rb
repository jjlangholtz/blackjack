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
    show_dealer_hand
    show_player_hand
    get_hit_or_stand
  end

  def game_round
    show_dealer_hand
    show_player_hand
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
      dealer_draws
    end
  end

  def compare_to_dealer
    puts "You have #{@player.hand.hand_value}."
    if @player.hand.hand_value == @dealer.hand.hand_value
      puts "The dealer has #{@dealer.hand.hand_value}. Dealer wins!"
      you_lose
    elsif @player.hand.hand_value < @dealer.hand.hand_value
      puts "The dealer has #{@dealer.hand.hand_value}. Dealer wins!"
      you_lose
    else
      puts "The dealer has #{@dealer.hand.hand_value}. You win!"
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
    while @dealer.hand.hand_value < 17
      @dealer.draw
    end
    if @dealer.hand.value > 21
      puts 'The dealer has busted!'
      you_win
    else
      compare_to_dealer
    end
  end

  def finish_game
    puts 'You are out of chips! Game over :('
  end
end

game = Blackjack.new
game.play
