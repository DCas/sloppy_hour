FactoryGirl.define do

  factory :venue do
    name "Strange Brew Tavern"
    street_number 88
    street "Market Street"
    city "Manchester"
    state "NH"
    zipcode "03101"
    country "US"

    factory :venue_with_deals do

      transient do
        deals_count 1
      end

      after(:create) do |venue, evaluator|
        create_list(:deal_with_occurrences, evaluator.deals_count, venue: venue)
      end

    end

  end

  trait :close do
    latitude 42.9905932
    longitude -71.4653185
  end

  trait :far do
    latitude 34.043018
    longitude -118.267254
  end

end
