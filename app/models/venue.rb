class Venue < ActiveRecord::Base
  validates :name, :street, :street_number, :city, :state, :zipcode, :country, presence: true
  before_validation :ensure_geocoded unless :geocoded?
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude do |venue,results|
    if geo = results.first
      venue.street_number = geo.street_number
      venue.street        = geo.address
      venue.city          = geo.city
      venue.state         = geo.state
      venue.zipcode     ||= geo.postal_code
      venue.country       = geo.country_code
    end
  end

  def self.nearby(location, radius=20)
    Venue.near(location, radius)
  end

  def address
    street_number.to_s + ' ' + [street, city, state].compact.join(', ') + ' ' + zipcode.to_s
  end

end