module Events
  class Fetch
    def self.call(event_params)
      events = Event.all

      if event_params[:theme]
        events = events.where("theme ILIKE ?", "%#{event_params[:theme]}%")
      end

      if event_params[:is_favorite]
        events = events.where({ :is_favorite => event_params[:is_favorite] })
      end

      if event_params[:order_by]
        events = events.order(start_time: event_params[:order_by])
      end

      if event_params[:user_id]
        events = events.where(:user_id => event_params[:user_id])
      end

      events = events.order(created_at: :desc)
    end
  end
end