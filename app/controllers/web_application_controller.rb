class WebApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'webapp'
  before_action :authenticate_user!
end
