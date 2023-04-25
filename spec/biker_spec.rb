require "./lib/ride"
require "./lib/biker"

RSpec.describe Biker do
  before(:each) do
    @biker = Biker.new("Kenny", 30)
  end

  describe "#initialize" do
    it "exists with attributes" do
      expect(@biker.name).to eq("Kenny")
      expect(@biker.max_distance).to eq(30)
      expect(@biker.rides).to eq({})
      expect(@biker.acceptable_terrain).to eq([])
    end
  end

  describe "#learn_terrain!(terrain)" do
    it "adds a new terrain to bikers acceptable_terrain" do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)

      expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
    end
  end
end