require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "Relationships" do
    it {should have_many(:user_events)}
    it {should have_many(:users).through(:user_events)}
  end
end
