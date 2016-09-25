class User < ActiveRecord::Base



has_many :reviews, dependent: :destroy
has_many :reservations, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable # other devise options

  validates :name, length:{maximum:10}, presence:true
  validates :profile, length:{maximum:1000}, presence:false
  validates :area, presence:false

  acts_as_messageable
  

  def mailboxer_name
    self.name
  end


def mailboxer_email(object)
  email
end

  mount_uploader :mainpic, ImageUploader

end
