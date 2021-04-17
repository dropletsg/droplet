class EmailNotificationJob < ApplicationJob
  queue_as :default

  def perform(c)
    CoordinatorMailer.notification_email(c).deliver
  end


end
