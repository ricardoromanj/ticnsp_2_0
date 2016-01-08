class Notification < ActiveRecord::Base
  belongs_to :recipient, class_name: 'User'
  belongs_to :actor, class_name: 'User'
  belongs_to :notifiable, polymorphic: true

  scope :unread, -> { where( read_at: nil ) }
  scope :read, -> { where( 'read_at NOT null' ) }
  scope :latest, -> { order( created_at: :desc ).limit(30) }

  def human_notifiable
    if notifiable.class == Notice
      { text: 'un aviso', icon: 'fa fa-comments-o', color: "#{ notifiable.notice_type_color }" }
    end
  end

end
