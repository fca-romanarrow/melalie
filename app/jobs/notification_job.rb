class NotificationJob < ApplicationJob
  queue_as :default

  def perform(book)
    # Do something later
  end
end
