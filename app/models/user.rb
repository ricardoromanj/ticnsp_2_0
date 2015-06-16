class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, # :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Gravatar
  include Gravtastic
  gravtastic

  # Serialized objects
  serialize :recents
  serialize :favorites
  serialize :settings

  def full_name
  	"#{name} #{lastname}"
  end

  def current_image
  	if use_gravatar?
  		gravatar_url(default: 'identicon')
  	else
  		# ... Refile stuff
  	end
  end
end
