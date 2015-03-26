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