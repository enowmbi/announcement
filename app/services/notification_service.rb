class NotificationService
  def call
    NotificationsMailer.submitted.deliver_now
  end
end
