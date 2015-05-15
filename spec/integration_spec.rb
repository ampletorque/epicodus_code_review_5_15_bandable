require('capybara/rspec')
require('spec_helper')
Capybara.app = Sinatra::Application
require('./app')



describe('index get', {:type => :feature}) do
  it('Displays index page') do
    visit('/')
    expect(page).to have_content('Bandable')
  end
end

describe('bands path', {:type => :feature}) do
  it('Displays bands page') do
    visit('/bands')
    fill_in("name", {:with => "Sisters of Mercy"})
    click_button("Add band")
    expect(page).to have_content('Sisters')
    click_link("Go to Venues")
    expect(page).to have_content('Venues')
    fill_in("name", {:with => "Jacobite Rebellion"})
    click_button("Add venue")
    expect(page).to have_content('Jacobite')
    click_link("Go to Bands")
    click_link('Edit band')
    expect(page).to have_content('Update Sisters')
    fill_in("name", {:with => "Brothers of Ardor"})
    click_button("Change")
    expect(page).to have_content('Brothers')
    select("Jacobite Rebellion", :from => "venue_id")
    click_button("Add venue")
    expect(page).to have_content('Jacobite')
    expect(page).to have_content('current venues')
    click_button("Delete band")
    expect(page).to have_content('There are no bands yet.')
  end
end
