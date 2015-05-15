require('header_spec')

describe(Band) do

  it("Returns venues a band plays in") do
    band_1 = Band.create({:name => "Sisters of Mercy"})
    venue_1 = band_1.venues.create(:name => "Vicar Street")
    #venue_1 = Venue.create({:name => "Vicar Street", :band_id => band_1.id})
    expect(band_1.venues).to eq([venue_1])
  end

end
