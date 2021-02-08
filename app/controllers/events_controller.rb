# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events = Events::Fetch.call(params)
    render json: @events, include: { user: { only: %i[id email] } }
  end

  def show
    @event = Event.find(params[:id])
    render json: @event, include: { user: { only: %i[id email] } }
  end

  def create
    @event = Event.new(event_params)

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
