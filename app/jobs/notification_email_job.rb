class NotificationEmailJob
  include SuckerPunch::Job

  def perform( user, notification )
    # Email notification
    if user.usertype =~ /coordinator^/
      CoordinatorMailer.notify_coordinator( user, notification ).deliver

      # Also send Twilio alert

    else

    end
  end
end
