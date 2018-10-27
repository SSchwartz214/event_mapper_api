require 'rails_helper'

describe "User Events API" do
  it 'can destroy a record from the user_events table' do
    seth = create(:user)
    concert = seth.events.create(name: 'Drake', e_id: '123', url: 'www.drake.com', img: 'drake.jpeg', date: "Sun, Dec 9, 2018 6:00 PM", venue_name: "Pepsi Center", address: "2009 Larimer St Denver, CO 80205", lat: "39.1", lng: "-11.2", distance: "1.3")

    count = UserEvent.count
    user_event = UserEvent.last

    delete "/api/v1/users/#{seth.id}/events/#{concert.id}"

    expect(UserEvent.count).to eq(count - 1)
    expect{UserEvent.find(user_event.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end