require("rspec")
require("pg")
require("sinatra/activerecord")
require("band")
require("venue")
require("pry")

RSpec.configure do |config|

  config.after(:each) do

    Venue.all().each() do |venue|
      venue.destroy()
    end

    Band.all().each() do |band|
      band.destroy()
    end

  end

end
