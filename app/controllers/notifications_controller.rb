class NotificationsController < WebApplicationController
  before_action :set_notifications, only: [ :index, :mark_as_read ]

  def index
  end

  def read
    @notifications = Notification.where( recipient: current_user ).read.order( created_at: :desc )
  end

  def mark_as_read
    @notifications.update_all( read_at: Time.zone.now )
    render json: { success: true }
  end

  private
    def set_notifications
      @notifications = Notification.for_user( current_user ).unread.order( created_at: :desc )
    end
end
