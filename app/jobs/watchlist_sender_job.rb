class WatchlistSenderJob < ApplicationJob
  queue_as :default

  def perform(user, event)
    UserNotifierMailer.send_watchlist_email(user, event).deliver_now
  end
end
