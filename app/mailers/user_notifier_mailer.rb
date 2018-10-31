class UserNotifierMailer < ApplicationMailer
  def send_watchlist_email
    @user = user
    @event = event 
    mail(to: user.email, subject:  "#{event} added to your EventMapper watch list" )
  end
end
