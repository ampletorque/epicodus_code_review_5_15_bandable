require("sinatra/activerecord")
require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/band")
require("./lib/venue")
require("pg")


get('/') do
  erb(:index)
end

get('/bands') do
  @bands = Band.all
  erb(:bands)
end

get('/venues') do
  @venues = Venue.all
  erb(:venues)
end

post("/bands") do
  name = params.fetch("name")
  band = Band.create({:name => name})
  redirect('/bands')
end

post("/venues") do
  name = params.fetch("name")
  venue = Venue.create({:name => name})
  redirect('/venues')
end

get('/bands/:id') do
  @band = Band.find(params.fetch("id").to_i)
  @venues = Venue.all()
  erb(:band_view)
end

patch("/bands/:id") do
  name = params.fetch("name")
  @band = Band.find(params.fetch("id").to_i)
  @band.update({:name => name})
  url = "/bands/" + params.fetch("id")
  redirect(url)
end

post("/bands/:id") do
  @band_id = params.fetch("id").to_i()
  @venue_id = params.fetch("venue_id")
  @venue = Venue.find(@venue_id)
  @band = Band.find(@band_id)
  @band.venues.push(@venue)
  url = "/bands/" + params.fetch("id")
  redirect(url)
end

delete("/bands/:id") do
  @band = Band.find(params.fetch("id").to_i)
  @band.delete()
  redirect('/bands')
end

get('/venues/:id') do
  @venue = Venue.find(params.fetch("id").to_i)
  @bands = Band.all()
  erb(:venue_view)
end

patch("/venues/:id") do
  name = params.fetch("name")
  @venue = Venue.find(params.fetch("id").to_i)
  @venue.update({:name => name})
  url = "/venues/" + params.fetch("id")
  redirect(url)
end

post("/venues/:id") do
  @venue_id = params.fetch("id").to_i()
  @band_id = params.fetch("band_id")
  @venue = Venue.find(@venue_id)
  @band = Band.find(@band_id)
  @venue.bands.push(@band)
  url = "/venues/" + params.fetch("id")
  redirect(url)
end

delete("/venues/:id") do
  @venue = Venue.find(params.fetch("id").to_i)
  @venue.delete()
  redirect('/venues')
end
