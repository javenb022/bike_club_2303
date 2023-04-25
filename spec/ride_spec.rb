require "./lib/ride"

RSpec.describe Ride do
  before(:each) do
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})

  end

  describe '#initialize' do
    it 'exists with attributes' do
      expect(@ride1).to be_a(Ride)
      expect(@ride1.name).to eq("Walnut Creek Trail")
      expect(@ride1.distance).to eq(10.7)
      expect(@ride1.terrain).to eq(:hills)
      expect(@ride1.loop?).to eq(false)
    end
  end

  describe "#total_distance" do
    it "can calculate total distance of a ride" do
      expect(@ride1.total_distance).to eq(21.4)
    end
  end
end