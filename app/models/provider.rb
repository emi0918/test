class Provider < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 has_many :notes, dependent: :destroy
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



          acts_as_messageable

     def mailboxer_user_name
       self.user_name
     end

     def mailboxer_email(object)
       self.email
     end

     
end
