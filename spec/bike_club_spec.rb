require "./lib/ride"
require "./lib/biker"
require "./lib/bike_club"

RSpec.describe BikeClub do
  before(:each) do
    @bike_club1 = BikeClub.new("Hell's Angels")
    @biker1 = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
  end

  describe "#initialize" do
    it "exists with attributes" do
      expect(@bike_club1).to be_a(BikeClub)
      expect(@bike_club1.name).to eq("Hell's Angels")
      expect(@bike_club1.bikers).to eq([])
    end
  end

  describe "#add_biker(biker)" do
    it "adds a biker to the bike clubs bikers" do
      expect(@bike_club1.bikers).to eq([])

      expect(@bike_club1.add_biker(@biker1)).to eq([@biker1])
    end
  end
end