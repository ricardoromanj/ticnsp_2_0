class NoticeEmailJob
  include SuckerPunch::Job

  def perform( user, notice )
    # Email notification
    CoordinatorMailer.notice_coordinator( user, notice ).deliver

    # Twilio notification
    mobile_phones = user.phones.where( phone_type: 'mobile' )
    if mobile_phones.count > 0
      # If the user has at least one mobile number, create the sender and send
      sender = TICTwilio::Alerts.new
      sender.send_alert( mobile_phones.first.number, "Alertas TIC - Ha sido publicado un aviso, entra al portal para verlo" )
    end
  end
end
