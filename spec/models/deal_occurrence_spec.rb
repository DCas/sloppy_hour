require 'rails_helper'

describe DealOccurrence do
  it { should belong_to(:deal) }

  describe ".on_date(date)" do
    it "returns records occurring on given date"
  end

  describe ".today" do
    it "returns today's DealOccurrences"
  end

end