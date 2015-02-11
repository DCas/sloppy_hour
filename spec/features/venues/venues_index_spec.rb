require 'rails_helper'

feature 'Venues index' do

  scenario 'visitor sees venues list' do
    venue1 = FactoryGirl.create(:venue)
    venue2 = FactoryGirl.create(:venue, name: "The Shaskeen")
  	visit venues_path
  	expect(page).to have_content "Venues"
    expect(page).to have_content venue1.name
    expect(page).to have_content venue2.name
  end

end