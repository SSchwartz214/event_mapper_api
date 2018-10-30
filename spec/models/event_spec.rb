require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "Validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:e_id)}
    it {should validate_presence_of(:url)}
    it {should validate_presence_of(:img)}
    it {should validate_presence_of(:date)}
    it {should validate_presence_of(:venue_name)}
    it {should validate_presence_of(:address)}
    it {should validate_presence_of(:lat)}
    it {should validate_presence_of(:lng)}
    it {should validate_presence_of(:distance)}
    it {should validate_presence_of(:unix)}
  end

  describe "Relationships" do
    it {should have_many(:user_events)}
    it {should have_many(:users).through(:user_events)}
  end
end
