class WelcomeCoordinatorEmailJob
  include SuckerPunch::Job

  def perform(user, temp_password)
    # Send email to new user. The email contains his temporary password
    CoordinatorMailer.welcome_coordinator(user, temp_password).deliver

    # Send message
    mobile_phones = user.phones.where( phone_type: 'mobile' )
    if mobile_phones.count > 0
      # If the user has at least one mobile number, create the sender and send.
      sender = TICTwilio::Alerts.new
      sender.send_alert( mobile_phones.first.number, "Bienvenido al portal de TIC. Revisa tu correo para detalles de tu cuenta." )
    end
  end
end
