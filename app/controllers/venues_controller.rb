class VenuesController < ApplicationController
  before_filter :set_venue, only: [:show, :edit, :update, :destroy]

  def index
    if search_params
      @venues = Venue.near(params[:search][:location], 20).with_deals_on(Date.current)
    else
      @venues = Venue.near(@lat_lng, 20).with_deals_on(Date.current)
    end
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

  def search_params
    params[:search] && params[:search][:location]
  end

end
