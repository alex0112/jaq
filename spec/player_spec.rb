RSpec.describe Jaq::Player do

  before(:all) do
    @player = Jaq::Player.new("Jack")
  end

  describe "#new" do
    it "creates a new player with an empty hand" do
      expect(@player.hand.length).to eq(0)
    end
  end

end
