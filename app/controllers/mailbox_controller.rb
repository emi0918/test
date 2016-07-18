class MailboxController < ApplicationController
 

  def inbox
    @inbox = mailbox.inbox
    @active = :inbox
  end

  def sent
    @sent = mailbox.sentbox
    @active = :sent
  end

 def mailbox
  if current_user.try(:provider_pic?)
       @mailbox ||= current_provider.mailbox
  else
      
        @mailbox ||= current_user.mailbox
  end
end
end


