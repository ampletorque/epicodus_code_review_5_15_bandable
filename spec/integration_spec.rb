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
