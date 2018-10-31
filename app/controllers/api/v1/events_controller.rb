class Api::V1::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    events = Event.all
    render json: events
  end

  def create 
    event = Event.new(event_params)
    user = User.update_or_create(user_params)

    if event.save && user && !user.events.pluck(:e_id).include?(event.e_id)
      UserEvent.create!(event: event, user: user)
      render json: { event: event }
    else
      render json: {error: 'Unable to create event entry'}, status: 404
    end
  end

  private

    def event_params
      params.require(:event).permit(:name, :e_id, :url, :img, :date, :venue_name, :address, :lat, :lng, :distance, :unix)
    end

    def user_params
      params.require(:user).permit(:given_name, :family_name, :email, :google_id, :imageUrl) 
    end
end