class WebApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'webapp'
  before_action :authenticate_user!
  before_action :set_current_semester


  private
    def set_current_semester
      @current_semester = Semester.where( current: true ).first
    end
end
