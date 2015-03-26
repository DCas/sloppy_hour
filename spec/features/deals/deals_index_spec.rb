require 'rails_helper'

feature 'Deals index' do

  scenario 'visitor sees deals list' do
    deal1 = FactoryGirl.create(:deal)
    venue2 = FactoryGirl.create(:deal, title: "A second deal")
  	visit venues_path
    expect(page).to have_content venue1.name
    expect(page).to have_content venue2.name
  end

end