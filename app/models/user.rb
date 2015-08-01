class User < ActiveRecord::Base
  # Set default values for settings
  before_create :set_defaults

  # Relations
  has_many :phones
  has_many :emails

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

  # Serialized objects
  serialize :recents
  serialize :favorites
  serialize :settings

  def full_name
  	"#{name} #{lastname}"
  end

  def current_image(w, h)
  	if use_gravatar?
  		gravatar_url(default: 'identicon')
  	else
  		Refile.attachment_url(self, :image, :fill, w, h, format: 'jpg');
  	end
  end

  def set_setting(key, value)
    self.settings[key] = value
    self.save
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

end
