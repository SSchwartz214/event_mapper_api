require 'rails_helper'

describe "Events API" do
  it "can add an event to a user's watch list" do
    seth = create(:user, gid: "12345")
    count = UserEvent.count

    event_params = { name: 'Drake', e_id: '123', url: 'www.drake.com', img: 'drake.jpeg', date: "Sun, Dec 9, 2018 6:00 PM", venue_name: "Pepsi Center", address: "2009 Larimer St Denver, CO 80205", lat: "39.1", lng: "-11.2", distance: "1.3" }
    user_params = { given_name: "seth", family_name: "schwartz", email: "seth@gmail.com", google_id: "12345" }

    post "/api/v1/users/#{seth.id}/events/", params: {event: event_params, user: user_params }

    expect(UserEvent.count).to eq(count + 1)
    expect(UserEvent.last.event.id).to eq(Event.last.id)
    expect(UserEvent.last.user.id).to eq(seth.id)
    expect(response.status).to eq(201)
    expect(JSON.parse(response.body)['message']).to eq("Successfully added #{Event.last.name} to #{seth.first_name}'s watch list")
  end
end
