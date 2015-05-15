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
  redirect('/')
end

post("/venues") do
  name = params.fetch("name")
  venue = Venue.create({:name => name})
  redirect('/')
end

get('/bands/:id') do
  @band = Band.find(params.fetch("id").to_i())
  @venues = Venue.all()
  erb(:band_view)
end

patch("/bands/:id") do
  name = params.fetch("name")
  @band = Band.find(params.fetch("id").to_i())
  @band.update({:name => name})
  redirect("/bands/{%=:id%}")
end

post("/bands/:id") do
  @band_id = params.fetch("id").to_i()
  @venue_ids = params.fetch("venue_ids")
  @band = Band.find(@employee_id)
  @venues = Venue.all
  @band_venues = @band.venues
  @band.update({:venue_ids => venue_ids})
  redirect("/bands/{%=:id%}")
end

delete("/employees/:id") do
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.delete()
  redirect('/employees')
end

get('/venues/:id') do
  @venue = Venue.find(params.fetch("id").to_i())
  @bands = Band.all()
  erb(:venue_view)
end

patch("/venues/:id") do
  name = params.fetch("name")
  @venue = Venue.find(params.fetch("id").to_i())
  @venue.update({:name => name})
  redirect("/venues/{%=:id%}")
end

post("/venues/:id") do
  @venue_id = params.fetch("id").to_i()
  @band_ids = params.fetch("band_ids")
  @venue = Venue.find(@venue_id)
  @bands = Band.all
  @venue_bands = @venue.bands
  @vnue.update({:band_ids => band_ids})
  redirect("/venues/{%=:id%}")
end

delete("/venues/:id") do
  @venue = Venue.find(params.fetch("id").to_i())
  @venue.delete()
  redirect('/venues')
end
