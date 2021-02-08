# frozen_string_literal: true

module Events
  class Fetch
    def self.call(event_params)
      events = Event.includes(:user).all.order(created_at: :desc)

      events = events.where('theme ILIKE ?', "%#{event_params[:theme]}%") if event_params[:theme]

      events = events.where({ is_favorite: event_params[:is_favorite] }) if event_params[:is_favorite]

      events = events.order(start_time: event_params[:order_by]) if event_params[:order_by]

      events = events.where(user_id: event_params[:user_id]) if event_params[:user_id]

      events
    end
  end
end
