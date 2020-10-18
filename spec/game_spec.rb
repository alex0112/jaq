RSpec.describe Jaq::Game do

  before(:all) do
    @game = Jaq::Game.new()
  end

  describe "#new" do
    it "makes a new game with n number of players" do
      expect(@game.players.length).to eq(1)
      expect(Jaq::Game.new(players: 2).players.length).to eq(2)
    end
  end

  describe ".dealer" do
    it "returns an object of the class Dealer" do
      expect(@game.dealer).to be_an_instance_of(Jaq::Dealer)
    end
  end
  
end
