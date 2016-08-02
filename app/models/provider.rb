class Provider < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 has_many :notes, dependent: :destroy
 has_many :mailboxer_conversations

  has_many :reservations, dependent: :destroy
 has_many :contacts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


 mount_uploader :provider_pic, ProviderPicUploader
 

          acts_as_messageable

     def mailboxer_name
       self.name
     end

     def mailboxer_email(object)
       self.email
     end  
end