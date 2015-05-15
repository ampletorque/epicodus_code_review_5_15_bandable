require('spec_helper')

describe(Venue) do

  it("Returns bands a venue hosts") do
    band_1 = Band.create({:name => "Juno Reactor"})
    venue_1 = band_1.venues.create(:name => "Coronet Theatre")
    #venue_1 = Venue.create({:name => "Vicar Street", :band_id => band_1.id})
    expect(venue_1.bands).to eq([band_1])
  end

  it("validates for empty name") do
    venue_1 = Venue.new({:name => ""})
    band_1 = Band.create({:name => "Band"})
    venue_2 = band_1.venues.new({:name => ""})
    expect(venue_1.save).to(eq(false))
    expect(venue_2.save).to(eq(false))
  end

end
