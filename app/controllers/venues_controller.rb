class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
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

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :street, :city, :state, :zip, :country)
  end
end
