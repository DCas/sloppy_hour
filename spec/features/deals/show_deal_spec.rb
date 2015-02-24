require 'rails_helper'

feature "Show Deal" do

  scenario 'visitor sees deal details' do
    deal = create(:deal)
    visit deal_path(deal)
    expect(page).to have_content deal.title
  end

end