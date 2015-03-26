FactoryGirl.define do

  factory :venue do
    name "Strange Brew Tavern"
    street_number 88
    street "Market Street"
    city "Manchester"
    state "NH"
    zipcode "03101"
    country "US"
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
