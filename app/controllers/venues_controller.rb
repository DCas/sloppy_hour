class VenuesController < ApplicationController
  before_filter :set_venue, only: [:show, :edit, :update, :destroy]

  def index
    @venues = Venue.near(user_location, 20)
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
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @venue.update(venue_params)
      redirect_to @venue
    else
      redirect_to edit_venue_path(@venue.id)
    end
  end

  def destroy
    if @venue.delete
      redirect_to venues_path
    else
      redirect_to edit_venue_path(@venue.id)
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :street, :city, :state, :zipcode, :country)
  end

  def set_venue
    @venue = Venue.find(params[:id])
  end

end
