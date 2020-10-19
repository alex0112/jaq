> This README is to provide some insight into my thought process for the code contained in this application.

# Jaq
Jaq is the beginnings of a small ruby gem that plays a command line game of blackjack. I did my best to limit myself to four hours on this project, and so the project is less complete than I would like. I emphasized readabilty in the code, and proper abstraction. Initially I followed a Test Driven Development style, but this proved to be time consuming and considering the four hour constraint on the project I chose to forgo that aspect of the program. I feel that unit testing is one of my largest strengths as a developer and I can provide other examples of unit tested code I have developed upon request.

### Top Level Logic:
I chose to begin the begin the process by writing out pseudo-ruby of what the main event loop for the game would look like. Which can be seen in the top-level module `lib/jaq.rb`:
	
```ruby
def run()
  dealer = Jaq::Dealer.new()
  players = [Jaq::Player.new("Player 1", dealer)]
  
  while dealer.still_playing?(players) and players.all?(&:still_playing?) do
    dealer.take_turn()
    players.each { |player| player.take_turn() }
  end
  
end
```

### Abstractions:
- The player class (in `lib/jaq/player.rb`) implements methods that are used to drive the logic within the main loop. 

- The dealer class in `lib/dealer.rb` inherits most of its functionality from the player class, with the exception of the overridden method `take_turn`:  Where `take_turn` for a Player normally provides a prompt for user input and allows the player to hit or hold, the Dealer overrides this behaviour and instead checks to see if one of the three conditions in which the dealer must hit is satisfied. The Dealer also requires a set of players to play with.

- I stumbled upon a [card gem](https://github.com/jdan/rubycards) on Github with some nice ASCII graphics representing cards which from which I intended to use the Card class they provided, while either building my own or extending the existing classes in the library for Decks and Hands. I was unable to work on this aspect of the game due to the time constraint.


I hope this document was helpful in gaining insight into my thought process on this project. Please feel free and reach out to me if you have any questions. My [Github Profile](https://github.com/alex0112) also contains other examples of my work and coding style. Best of luck with your hiring process.
