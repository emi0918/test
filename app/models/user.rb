class User < ActiveRecord::Base

 has_many :likes, dependent: :destroy
 has_many :like_notes, through: :likes, source: :note
 has_many :likes
 has_many :like_notes, through: :likes, source: :note
 has_many :mailboxer_conversations
 has_many :contacts
has_many :reviews, dependent: :destroy
has_many :notes

  has_many :reservations
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

  mount_uploader :profile_pic, ProfilePicUploader


  # userオブジェクトから呼び出せるインスタンスメソッドとして定義
  def set_image(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/user_images/#{file_name}", 'wb') { |f|
        f.write(file.read)
      }
      self.image = file_name
    end
  end



end
