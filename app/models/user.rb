class User < ActiveRecord::Base

 has_many :likes, dependent: :destroy
 has_many :like_notes, through: :likes, source: :note
 has_many :likes
 has_many :like_notes, through: :likes, source: :note
 has_many :mailboxer_conversations
 has_many :contacts
has_many :reviews, dependent: :destroy
has_many :notes

  has_many :reservations, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable # other devise options

  validates :profile, length:{maximum:1000}, presence:false
  validates :area, presence:false

  acts_as_messageable

  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end

  mount_uploader :mainpic, ImageUploader

end