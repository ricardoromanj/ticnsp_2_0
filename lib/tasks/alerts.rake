namespace :alerts do

  task welcome: :environment do
    sender = TICTwilio::Alerts.new

    User.where( "usertype <> 'tutor'" ).each do |user|
      sender.send_alert( user.phones.where( phone_type: 'mobile' ).first.number, "ALERTAS TIC. Feliz Navidad." )
    end
  end
end
