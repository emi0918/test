class Provider < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

has_many :provider_accounts, dependent: :destroy
 accepts_nested_attributes_for :provider_accounts ,allow_destroy: true
 

has_many :store_infos, dependent: :destroy
 accepts_nested_attributes_for :store_infos,allow_destroy: true

 has_many :notes, dependent: :destroy

  has_many :reservations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 mount_uploader :mainpic, ImageUploader
 
  validates :email, presence:  true
   acts_as_messageable

     def mailboxer_name
       self.name
     end

     def mailboxer_email(object)
       self.email
     end 
     
end
