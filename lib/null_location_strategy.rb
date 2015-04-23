class NullLocationStrategy
  def coordinates
    [default_location['latitude'], default_location['longitude']]
  end

  private

  def default_location
    {
      'latitude'     => 42.9956397,
      'longitude'    => -71.4547891,
      'address'      => 'asdf',
      'state'        => 'New Hampshire',
      'state_code'   => 'NH',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  end
end