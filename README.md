# Blackjack

> Blackjack, also known as twenty-one, is the most widely played casino banking game in the world.[1] Blackjack is a comparing card game between a player and dealer, meaning that players compete against the dealer but not against any other players. It is played with one or more decks of 52 cards. The object of the game is to "beat the dealer", which can be done in a number of ways:

> Get 21 points on your first two cards (called a blackjack), without a dealer blackjack;
Reach a final score higher than the dealer without exceeding 21; or
Let the dealer draw additional cards until his or her hand exceeds 21.

> -from [Blackjack on Wikipedia](http://en.wikipedia.org/wiki/Blackjack)

# Usage

[Sample script](https://gist.github.com/jjlangholtz/a586f3f2da32ef45e272)

Clone into local directory and change directory into /blackjack then run:

    ruby -Ilib lib/blackjack.rb

You start the game with $100 in chips and the game ends when you no longer have
any chips left.

Each round of the game starts with the dealer drawing two cards for himself and dealing two
cards to you. Only one of the dealer's cards is revealed to you. Afterwards you
can input H - Hit, S - Stand, or D - Double-down.

H - The dealer deals you another card.

S - Keep your current hand.

D - The dealer deals only one more card and your bet is doubled.


# Todo

* Write help command and documentation
* Add more tests for behavior
* Re-factor code and conform to style guidelines
* Add 'Split' feature
