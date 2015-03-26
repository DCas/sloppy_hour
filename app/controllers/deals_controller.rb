class DealsController < ApplicationController
  before_filter :set_deal, only: [:show, :edit, :update, :destroy]
  before_filter :filter_blank_times, only: [:create, :update]
  
  def index
    @deals = Deal.all
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
    params.require(:deal).permit(:title, :description, :venue_id, :deal_start, :deal_end, :time, schedule_attributes: Schedulable::ScheduleSupport.param_names)
  end

  def filter_blank_times
      if deal_params['deal_start(3i)'].blank?
          deal_params['deal_start(1i)'] = ""
          deal_params['deal_start(2i)'] = ""
          deal_params['deal_start(3i)'] = ""
          deal_params['deal_start(4i)'] = ""
          deal_params['deal_start(5i)'] = ""
      end
      if deal_params['deal_end(3i)'].blank?
          deal_params['deal_end(1i)'] = ""
          deal_params['deal_end(2i)'] = ""
          deal_params['deal_end(3i)'] = ""
          deal_params['deal_end(4i)'] = ""
          deal_params['deal_end(5i)'] = ""
      end
  end

end
