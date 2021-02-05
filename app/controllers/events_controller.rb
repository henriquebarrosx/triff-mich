class EventsController < ApplicationController
  def index
    @events = Event.all
    render json: @events
  end

  def show
    @event = Event.find(params[:id])
    render json: @event
  end

  def create
    @event = Event.create(event_params)

    if @event.save
      render json: @event
    else
      render json: { errors: @event.errors }
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      render json: @event
    else
      render json: { errors: @event.errors }
    end

  end

  private
  def event_params
    params.require(:event).permit(:user_id, :theme, :event_representative, :start_time, :end_time,
                                  :link, :description, :is_available, :is_favorite, :is_expired)
  end
end
