module Jaq

  class Game

    attr_reader :players, :dealer
    def initialize(players: 1)
      @players = generate_players(players)
      @dealer ||= Jaq::Dealer.new()
    end

    private
    def generate_players(number)
      (1..number).map { |n| n } 
    end

  end
  
end
