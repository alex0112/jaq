require "jaq/version"

module Jaq
  class Error < StandardError; end


  def run()
    dealer = Jaq::Dealer.new()
    players = [Jaq.Player.new("Player 1", dealer)]

    while dealer.still_playing?(players) and players.all?(&:still_playing?) do
      dealer.take_turn()
      players.each { |player| player.take_turn() }
    end

  end

  run()

end
