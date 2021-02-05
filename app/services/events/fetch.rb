module Events
  class Fetch
    def self.call(event_params)
      events = Event.all.order(created_at: :desc)

      if event_params[:theme]
        events = Event.where("theme ILIKE ?", "%#{event_params[:theme]}%").order(created_at: :desc)
      end

      if event_params[:is_favorite]
        events = Event.where({ :is_favorite => event_params[:is_favorite] }).order(created_at: :desc)
      end

      if event_params[:order_by]
        events = Event.all.order(start_time: event_params[:order_by])
      end

      events
    end
  end
end