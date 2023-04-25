require "./lib/ride"
require "./lib/biker"
require "./lib/bike_club"

RSpec.describe BikeClub do
  before(:each) do
    @bike_club1 = BikeClub.new("Hell's Angels")
  end

  describe "#initialize" do
    it "exists with attributes" do
      expect(@bike_club1).to be_a(BikeClub)
      expect(@bike_club1.name).to eq("Hell's Angels")
      expect(@bike_club1.bikers).to eq([])
    end
  end
end