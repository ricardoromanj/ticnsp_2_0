class MainWebappController < ApplicationController
  layout 'webapp'
  
  def dashboard
  	@hide_breadcrumb = true
  end
end
