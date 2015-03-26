Geocoder.configure(:lookup => :test)

Geocoder::Lookup::Test.add_stub(
  "Manchester, NH", [
    {
      'latitude'     => 42.9956397,
      'longitude'    => -71.4547891,
      'address'      => 'asdf',
      'state'        => 'New Hampshire',
      'state_code'   => 'NH',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
)
Geocoder::Lookup::Test.add_stub(
  "88 Market Street, Manchester, NH 03101", [
    {
      'latitude'  => 42.9905932,
      'longitude' => -71.4653185
    }
  ]
)