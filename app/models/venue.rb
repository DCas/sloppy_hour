require 'date_extensions'

class Venue < ActiveRecord::Base
  has_many :deals, dependent: :destroy
  has_many :deal_occurrences, through: :deals
  has_many :todays_deals, -> { occurring_on(Date.current) },
                              :class_name => "Deal"

  validates :city, :country, :name, :state, :street, :street_number, :zipcode, presence: true
  
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

  scope :with_deals_on, ->(date) {
    joins(:deals => :deal_occurrences).
      where(deal_occurrences: {:date => date.all_day}).
      distinct(:venue)
  }

  def address
    street_number.to_s + ' ' + [street, city, state].compact.join(', ') + ' ' + zipcode.to_s
  end

  def street_address
    street_number.to_s + ' ' + street
  end

end

