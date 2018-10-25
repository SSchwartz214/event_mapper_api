class Api::V1::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def create
    event = Event.where(id: params[:event_id].to_i).first
    user = User.where(id: params[:id].to_i).first

    if event && user
      UserEvent.create!(event: event, user: user)
      render json: {message: "Successfully added #{event.name} to #{user.first_name}'s watched events"}, status: 201
    else
      render json: {error: "Invalid event or user provided"}, status: 404
    end
  end
end
