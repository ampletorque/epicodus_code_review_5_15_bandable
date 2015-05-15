require('spec_helper')

describe(Band) do

  it("Returns venues a band plays in") do
    band_1 = Band.create({:name => "Sisters of Mercy"})
    venue_1 = band_1.venues.create(:name => "Vicar Street")
    #venue_1 = Venue.create({:name => "Vicar Street", :band_id => band_1.id})
    expect(band_1.venues).to eq([venue_1])
  end

  it("validates for empty name") do
    band_1 = Band.new({:name => ""})
    venue_1 = Venue.create({:name => "Venue"})
    band_2 = venue_1.bands.new({:name => ""})
    expect(band_1.save).to(eq(false))
    expect(band_2.save).to(eq(false))
  end

  it("capitalization") do
    band_1 = Band.create({:name => "awesome sauce"})
    expect(band_1.name).to(eq("Awesome Sauce"))
  end
end
