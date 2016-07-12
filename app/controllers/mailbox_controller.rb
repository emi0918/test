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
    @mailbox ||= current_provider.mailbox
  end


 def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  
end


