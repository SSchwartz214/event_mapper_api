class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :gid

  has_many :user_events
  has_many :events, through: :user_events

  def self.update_or_create(auth)
    user = User.find_by(gid: auth[:google_id]) || User.new

    user.attributes = {
      first_name: auth[:given_name],
      last_name: auth[:family_name],
      email: auth[:email],
      gid: auth[:google_id]
    }
    
    user.save
    user      
  end
end
