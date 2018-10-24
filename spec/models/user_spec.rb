require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:gid)}
  end

  describe "Relationships" do
    it {should have_many :user_events}
    it {should have_many(:events).through(:user_events)}
  end

  describe "Class Methods" do
    it "creates or updates itself from an oauth hash" do
      auth = {
        given_name: "Seth",
        family_name: "Schwartz",
        email: "seth@gmail.com",
        google_id: "12345"
      }

      User.update_or_create(auth)
      new_user = User.first
  
      expect(new_user.first_name).to eq("Seth")
      expect(new_user.last_name).to eq("Schwartz")
      expect(new_user.email).to eq("seth@gmail.com")
      expect(new_user.gid).to eq("12345")
    end
  end
end
