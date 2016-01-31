class User < ActiveRecord::Base
  validates :usertype, inclusion: { in: ['admin', 'general_coordinator', 'coordinator','tutor'] }
  # Set default values for settings
  before_create :set_defaults
  before_destroy :remove_recents_and_notifs

  # Attachments
  attachment :image, type: :image

  # Relations
  has_many :phones
  has_many :emails

  # Notifications relation
  has_many :notifications, foreign_key: :recipient_id

  # Enrollments relation
  has_many :group_enrollments, as: :enrolled
  has_many :coordinator_semesters, foreign_key: :coordinator_id

  accepts_nested_attributes_for :phones, allow_destroy: true, reject_if: (lambda {|attributes| attributes['number'].blank?})
  accepts_nested_attributes_for :emails, allow_destroy: true, reject_if: lambda {|attributes| attributes['email'].blank?}

  # Scopes
  scope :coordinators, -> { where( "usertype not like 'tutor'" ) }
  scope :tutors, -> { where( usertype: 'tutor' ) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, # :registerable,
         :recoverable, :rememberable, :trackable #, :validatable

  # Gravatar
  include Gravtastic
  gravtastic

  # Markable configuration
  acts_as_marker
  markable_as :responsible_user, by: :task
  markable_as :shared_user, by: :task
  markable_as :responsible_user, by: :project
  markable_as :shared_user, by: :project
  markable_as :coordinator_commission, by: :commission
  markable_as :coordinator_workshop, by: :workshop
  markable_as :coordinator_lecture, by: :lecture
  markable_as :coordinator_shepperding, by: :shepperding
  markable_as :coordinator_commission, by: :commission

  # Serialized objects
  serialize :recents
  serialize :favorites
  serialize :settings

  # Scopes
  scope :coordinators, -> { where( "usertype in ('coordinator', 'general_coordinator' )" ) }
  # scope :active_coordinators, -> { where( "usertype in ('coordinator', 'general_coordinator')" ).where( active: true ) }
  scope :not_tutors, -> { where( "usertype not like 'tutor'" ).where( active: true ) }
  scope :general_coordinators, -> { where( usertype: 'general_coordinator' ).where( active: true ) }

  def full_name
  	"#{name} #{lastname}"
  end

  def gender_text
    gender == 'h' ? 'Hombre' : 'Mujer'
  end

  def current_image(s = nil)
  	if use_gravatar? || image_id.blank?
  		self.use_gravatar = true
      self.save
      gravatar_options = { default: 'identicon' }
      gravatar_options[:size] = s if s
      gravatar_url(gravatar_options)
  	else
      if s # w && h
  		  Refile.attachment_url(self, :image, :fill, s, s, format: 'jpg');
      else
        Refile.attachment(self, :image)
      end
  	end
  end

  def usertype_string
    if usertype =~ /^admin$/
      'Administrador'
    elsif usertype =~ /^general/
      'Coordinador general'
    elsif usertype =~ /^coordinator$/
      'Coordinador'
    elsif usertype =~ /^tutor$/
      'Tutor'
    end
  end

  def set_setting(key, value)
    self.settings[key] = value
    self.save
  end

  def currently_enrolled?
    ( coordinator_semesters.count > 0 && usertype =~ /coordinator/ ) ? true : false
  end

  def self.active_coordinators
    self.where( id: CoordinatorSemester.where( semester: Semester.where( current: true ).first ).pluck( :coordinator_id ) )
  end

  private
    def set_defaults
      self.recents = Array.new(20)
      self.favorites = Array.new(20)
      self.settings = {
        sidebar_toggled: false,
        preferred_color: 'blue_dark'
      }
    end

    def remove_recents_and_notifs
      Notification.where( "recipient_id = ? or actor_id = ?", self.id, self.id ).each { |n| n.destroy }
      RecentItem.where( "( recentable_type = 'User' and recentable_id = ? ) or visitor_id = ?", self.id, self.id ).each { |r| r.destroy }
    end
end
