class EventsController < ApplicationController

  def new
    @distance = [20, 50, 100, 500]
  end

  def index
    @events = Event.scoped

    if params[:location].present?
      @events = Event.near(params[:location], params[:distance], order: :distance)
    end

    if params[:keywords].present?
      @events = @events.where('keywords LIKE ?', "%#{params[:keywords]}%")
    end

    if params[:start_time].present?
      s_time = Date.parse(params[:start_time])
      @events = @events.where('start_time >= ?', s_time,)
    end

    if params[:end_time].present?
      e_time = Date.parse(params[:end_time])
      @events = @events.where('end_time <= ?', e_time)
    end

    respond_to do |format|
      format.html
      format.js { render action: 'create'}
    end
  end
end
