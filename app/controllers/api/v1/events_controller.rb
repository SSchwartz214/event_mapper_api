class Api::V1::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    events = Event.all
    render json: events
  end

  def create 
    event = Event.new(event_params)
    if event.save
      render json: event
    else
      render json: {error: 'Unable to create event entry'}, status: 404
    end
  end

  private

    def event_params
      params.require(:event).permit(:name, :venue, :location)
    end
end