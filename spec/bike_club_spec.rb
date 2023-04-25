require "./lib/ride"
require "./lib/biker"
require "./lib/bike_club"

RSpec.describe BikeClub do
  before(:each) do
    @bike_club1 = BikeClub.new("Hell's Angels")
    @biker1 = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
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
      expect(@bike_club1.add_biker(@biker2)).to eq([@biker1, @biker2])
    end
  end

  describe "#most_rides" do
    it "returns the biker with the most logged rides" do
      @bike_club1.add_biker(@biker1)
      @bike_club1.add_biker(@biker2)
      @biker1.learn_terrain!(:gravel)
      @biker1.learn_terrain!(:hills)
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      @biker1.log_ride(@ride1, 92.5)
      @biker1.log_ride(@ride1, 91.1)
      @biker1.log_ride(@ride2, 60.9)
      @biker1.log_ride(@ride2, 61.6)
      @biker2.log_ride(@ride1, 97.0)
      @biker2.log_ride(@ride2, 67.0)

      expect(@bike_club1.most_rides).to eq(@biker1)
    end
  end

  describe "#best_time(ride)" do
    it "returns the biker with the best time of the given ride" do
      @bike_club1.add_biker(@biker1)
      @bike_club1.add_biker(@biker2)
      @biker1.learn_terrain!(:gravel)
      @biker1.learn_terrain!(:hills)
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      @biker1.log_ride(@ride1, 92.5)
      @biker1.log_ride(@ride1, 91.1)
      @biker1.log_ride(@ride2, 60.9)
      @biker1.log_ride(@ride2, 61.6)
      @biker2.log_ride(@ride1, 97.0)
      @biker2.log_ride(@ride2, 67.0)
      @biker2.log_ride(@ride2, 59.7)

      expect(@bike_club1.best_time(@ride1)).to eq(@biker1)
      expect(@bike_club1.best_time(@ride2)).to eq(@biker2)
    end
  end
end