class DealsController < ApplicationController
  # before_filter :authenticate_user!, except: [:index, :show]
  before_filter :set_deal, only: [:show, :edit, :update, :destroy]

  def index
    @deals = Deal.filtered(params[:filter])
  end

  def search

  end

  def show
  end

  def new
    @deal = Deal.new
    @venues = Venue.all
    respond_to do |format|
      format.html
      format.js { render 'new' }
    end
  end

  def create
    @deal = Deal.new(deal_params)
    if @deal.save
      redirect_to @deal
    else
      render 'new'
    end
  end

  def edit
    @venues = Venue.all
  end

  def update
    if @deal.update(deal_params)
      redirect_to @deal
    else
      render 'edit'
    end
  end

  def destroy
    @deal.delete
    redirect_to deals_path
  end

  private
  def set_deal
    @deal = Deal.find(params[:id])
  end

  def deal_params
    params.require(:deal).permit(:title, :description, :venue_id, :deal_start, :deal_end, :time, :filter, item_type_list: [], schedule_attributes: Schedulable::ScheduleSupport.param_names << [:start_time, :end_time])
  end

end
