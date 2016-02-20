class MainController < ApplicationController
  def index
    if user_signed_in?
      redirect_to '/dashboard'
    end
    @coordinators = User.active_coordinators + User.where(usertype: 'general_coordinator')
  end

  def leave_message
  	message_params = params.permit(:name, :email, :message_text)
  	message_params[:read] = false

  	if message_params[:message_text]
	  	if VisitorMessage.create(message_params)
	  		redirect_to '/#contact', notice: 'Mensaje enviado. ¡Muchas gracias!'
	  	else
	  		redirect_to '/#contact', alert: 'Tu mensaje no pudo ser enviado. Favor de intentar nuevamente.'
	  	end
		end
  end
end
