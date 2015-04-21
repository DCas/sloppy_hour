 class VenuesController < ApplicationController
  before_filter :set_venue, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    @venues = Venue.near(user_location, 20).with_deals_on(search_date)
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

  def search_date
    if params[:filter] && !params[:filter][:date].empty?
      if DateTime.parse(params[:filter][:date]).wday == DateTime.now.wday
        @search_date = Date.parse(params[:filter][:date])
      else
        @search_date = Chronic.parse("next " + params[:filter][:date])
      end
    else
      @search_date = Date.current
    end
    @search_date
  end

  def search_location
    if params[:filter] && !params[:filter][:location].empty?
      params[:filter][:location]
    else
      user_location
    end
  end

end
