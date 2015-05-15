require('header_spec')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application

describe('index get', {:type => :feature}) do
  it('Displays index page') do
    visit('/')
    expect(page).to have_content('Bandable')
  end
end

describe('bands get', {:type => :feature}) do
  it('Displays bands page') do
    visit('/bands')
    expect(page).to have_content('Bands')
  end
end

describe('venues get', {:type => :feature}) do
  it('Displays venues page') do
    visit('/venues')
    expect(page).to have_content('Venues')
  end
end

describe('band view get', {:type => :feature}) do
  band_1 = Band.create({:name => "Sisters of Mercy"})
  it('Displays band view page') do
    visit('/bands/' + band_1.id.to_s)
    expect(page).to have_content('Sisters')
  end
end
