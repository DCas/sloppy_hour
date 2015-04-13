class VenuesController < ApplicationController
  before_filter :set_venue, only: [:show, :edit, :update, :destroy]
  before_filter :user_location
  respond_to :html, :json

  def index
    @venues = Venue.near(location_query).with_deals_on(Date.current).preload(:todays_deals)
  end

  def show
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to @venue
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @venue.update(venue_params)
      redirect_to @venue
    else
      render 'edit'
    end
  end

  def destroy
    @venue.delete
    redirect_to venues_path
  end

  private
  def venue_params
    params.require(:venue).permit(:name, :street_number, :street, :city, :state, :zipcode, :country, :latitude, :longitude, :website, :google_place_id)
  end

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def location_query
    if params[:search] && params[:search][:location]
      params[:search][:location]
    else
      @lat_lng
    end
  end

end
