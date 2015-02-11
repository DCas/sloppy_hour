class Venue < ActiveRecord::Base
  validates :name, presence: true
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude do |venue,results|
    if geo = results.first
      venue.city    = geo.city
      venue.state   = geo.state
      venue.zipcode ||= geo.postal_code
      venue.country = geo.country_code
    end
  end
  after_validation :geocode

  def address
    [street, city, state, zipcode].compact.join(', ')
  end

  def address=(arg)

  end

end