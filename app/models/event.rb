class Event < ApplicationRecord
  belongs_to :user
  validates_presence_of :theme, :event_representative, :start_time, :end_time, :link, :description
end
