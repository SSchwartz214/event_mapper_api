class Event < ApplicationRecord
  validates_presence_of :name, :e_id, :url, :img, :date, :venue_name, :address, :lat, :lng, :distance

  has_many :user_events
  has_many :users, through: :user_events
end
