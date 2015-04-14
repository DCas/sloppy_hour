require 'rails_helper'

describe Deal do
  it { should validate_presence_of :title }
  it { should validate_presence_of :venue }

  it { should belong_to(:venue) }
  it { should have_one(:schedule) }

  describe "Deal.filtered" do
    pending
    it "should filter Deals" do
    end
  end

  describe ".destroy" do
    it "should destroy associated DealOccurrences" do
      pre_create_total_occurrences = DealOccurrence.count
      deal = FactoryGirl.create(:deal)
      pre_destroy_total_occurrences = DealOccurrence.count

      deal.destroy

      expect(DealOccurrence.count).to eq(pre_create_total_occurrences)
    end
  end

end