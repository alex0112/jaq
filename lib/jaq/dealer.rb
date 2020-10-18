require 'rubycards'
include RubyCards

module Jaq
  
  class Dealer << Jaq::Player

    attr_accessor :deck, :players

    @@UPPER_LIM = 17
    @@UPPER_LIM_WITH_ACE = 18

    def initialize(deck=nil, players=nil)
      @deck = deck || Deck.new()
      @players = nil
    end
    
    def take_turn
      if (self.players.hand_greater_than(self.hand.total)) or
        (hand.total < @@UPPER_LIM) or
        (hand.includes_ace? and hand.total < @@UPPER_LIM_WITH_ACE)
        hit()
    end

  end
end
n
