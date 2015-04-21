require 'rails_helper'

describe DealOccurrence do
  it { should belong_to(:deal) }

  describe ".on_date(date)" do
    it "returns records occurring on given date" do
      the_date = Date.parse("March 21, 1990")
      on_the_date = FactoryGirl.create(:deal_occurrence, date: the_date)
      not_on_the_date = FactoryGirl.create(:deal_occurrence, date: Date.parse("January 1, 2015"))

      results = DealOccurrence.on_date(the_date)

      expect(results).to include(on_the_date)
      expect(results).not_to include(not_on_the_date)
    end
  end

end
