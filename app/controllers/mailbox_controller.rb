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
  if current_user.try(:id?)
    @mailbox ||= current_user.mailbox
  else
      @mailbox ||= current_provider.mailbox
  end
end

end

