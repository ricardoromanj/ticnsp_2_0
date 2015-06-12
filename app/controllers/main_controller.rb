class MainController < ApplicationController
  def index
    if user_signed_in?
      redirect_to '/dashboard'
    end
		@coord_info = {
			'ana' => {
				name: 'Ana',
				position: 'Coordinadora general'
				},
			'dan' => {
				name: 'Daniel',
				position: 'Coordinador'
				},
			'hil' => {
				name: 'Hilda',
				position: 'Coordinadora'
				},
			'ils' => {
				name: 'Ilse',
				position: 'Coordinadora'
				},
			'isa' => {
				name: 'Isabel',
				position: 'Coordinadora'
				},
			'jor' => {
				name: 'Jorge',
				position: 'Coordinador'
				},
			'lau' => {
				name: 'Laura',
				position: 'Coordinadora'
				},
			'med' => {
				name: 'Medellín',
				position: 'Coordinador general'
				},
			'ola' => {
				name: 'Olaves',
				position: 'Coordinador'
				},
			'pao' => {
				name: 'Paola',
				position: 'Coordinadora'
			},
			'gab' => {
				name: 'Gaby',
				position: 'Coordinadora'
			},
			'ric' => {
				name: 'Ricardo',
				position: 'Coordinador'
			}
		}
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
