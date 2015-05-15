require('header_spec')

describe(Venue) do

  it("Returns bands a venue hosts") do
    band_1 = Band.create({:name => "Juno Reactor"})
    venue_1 = band_1.venues.create(:name => "Coronet Theatre")
    #venue_1 = Venue.create({:name => "Vicar Street", :band_id => band_1.id})
    expect(venue_1.bands).to eq([band_1])
  end

end
