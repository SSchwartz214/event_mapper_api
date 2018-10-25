class Event < ApplicationRecord
  validates_presence_of :name, :venue, :location

  has_many :user_events
  has_many :users, through: :user_events
end
