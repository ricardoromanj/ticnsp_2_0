class User < ActiveRecord::Base
  # Set default values for settings
  before_create :set_defaults

  # Attachments
  attachment :image, type: :image

  # Relations
  has_many :phones
  has_many :emails

  accepts_nested_attributes_for :phones, allow_destroy: true, reject_if: lambda {|attributes| attributes['number'].blank?}
  accepts_nested_attributes_for :emails, allow_destroy: true, reject_if: lambda {|attributes| attributes['email'].blank?}

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
