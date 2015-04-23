class NullLocationStrategy
  attr :data

  def initialize
    @data = location_data
  end

  def coordinates
    [data['latitude'], data['longitude']]
  end

  private

  def location_data
    {
      'latitude'     => 42.9956397,
      'longitude'    => -71.4547891,
      'city'         => 'Manchester',
      'state'        => 'New Hampshire',
      'state_code'   => 'NH',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  end

end