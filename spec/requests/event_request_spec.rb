require 'rails_helper'

describe "Events API" do
  it "sends a list of events" do
    create_list(:event, 3)

    get '/api/v1/events'

    expect(response).to be_successful

    events = JSON.parse(body)

    expect(events.count).to eq(3)
  end

  it "can create a new event" do
    event_params = { name: "Drake", venue: "Pepsi Center", location: "Denver, CO"}

    post "/api/v1/events", params: {event: event_params}
    event = Event.last

    assert_response :success
    expect(response).to be_successful
    expect(event.name).to eq(event_params[:name])
  end

  it "returns a 400 if the event is not successfully created" do
    event_params = { name: 1 }

    post "/api/v1/events", params: {event: event_params}

    expect(response.status).to eq(404)
  end
end
