require 'rails_helper'

feature 'Show venue' do

  scenario 'visitor sees venue details' do
    venue = FactoryGirl.create(:venue)
  	visit venue_path(venue)
  	expect(page).to have_content venue.name
  end

end