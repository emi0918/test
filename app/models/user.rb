class User < ActiveRecord::Base
 has_many :notes
<<<<<<< HEAD
=======
   has_many :likes
  has_many :like_notes, through: :likes, source: :note
>>>>>>> responsive_seekle

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


<<<<<<< HEAD
   validates :user_name, length:{ maximum:10}, presence: false
=======
   validates :user_name, length:{ maximum:10}, presence:true
>>>>>>> responsive_seekle
   validates :profile, length:{maximum:1000}, presence:false
   validates :area, presence:false



<<<<<<< HEAD


=======
>>>>>>> responsive_seekle
 acts_as_messageable

def mailboxer_user_name
  self.user_name
end

def mailboxer_email(object)
  self.email
end

<<<<<<< HEAD
=======

>>>>>>> responsive_seekle
def self.find_for_facebook_oauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    unless user
      user = User.create( user_name:     auth.extra.raw_info.name,
                          provider: auth.provider,
                          uid:      auth.uid,
                          email:    auth.info.email,
                          token:    auth.credentials.token,
                          password: Devise.friendly_token[0,20] )
    end

  user
end
end
