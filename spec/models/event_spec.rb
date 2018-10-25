require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "Validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:venue)}
    it {should validate_presence_of(:location)}
  end

  describe "Relationships" do
    it {should have_many(:user_events)}
    it {should have_many(:users).through(:user_events)}
  end
end
