class Api::V1::UserEventsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    user = User.find(params[:user_id])

    events = user.events
    render json: events
  end

  def destroy
    user = User.find(params[:user_id])
    event = Event.find(params[:id])

    if user && event && UserEvent.find_by(user: user, event: event)
      user_event = UserEvent.find_by(user: user, event: event)
      user_event.destroy
      render json: {
        user: user.id,
        event: event.e_id
      }
    else
      render json: {error: 'Unable to delete watch list entry'}, status: 404
    end
  end

end