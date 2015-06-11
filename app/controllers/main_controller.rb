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

  end
end
