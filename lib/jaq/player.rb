require 'rubycards'
include RubyCards

module Jaq

  class Player

    attr_accessor :name, :hand, :dealer

    def initialize(name, dealer, hand=[])
      @dealer = dealer
      @hand = Hand.new
    end

    def take_turn()
      puts <<END_PROMPT
      #{self.name}'s Turn:

      #{self.hand}
      What would you like to do?
       1. Hit
       2. Hold

       > 
END_PROMPT

      response = gets.chomp()
      process_response(response)
    end

    def hand_greater_than(total)
      return self.hand.total > total
    end

    def still_playing?
      return not (self.holding? or self.busted?)
    end

    def hit
      self.dealer.deck.deal(1, self.hand)
      
      if self.hand.adds_to_twenty_one?
        self.holding = true
      elsif self.hand.exceeds_twenty_one?
        self.busted = true
    end

    private
    def process_resp(input)
      case input
      when "Hit" or "hit" or "1"
        self.hit()
      when "Hold" or "hold" or "2"
        self.hold()
      else
        puts "Unrecognized command."
        self.take_turn()
      end
    end
      
end
