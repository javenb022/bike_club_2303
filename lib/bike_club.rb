class BikeClub
  attr_reader :name,
              :bikers
  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
  end

  def most_rides
    num_of_rides = Hash.new(0)
    @bikers.each do |biker|
      biker.rides.sum do |ride|
        num_of_rides[biker] += ride[1].count
      end
    end
    num_of_rides.max_by do |biker, rides|
      return biker if rides = num_of_rides.values.max
    end
  end
end