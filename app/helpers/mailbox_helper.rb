module MailboxHelper
  def unread_messages_count
    mailbox.inbox(:unread => true).count(:id, :distinct => true)
  end
def unread_messages
	  mailbox.inbox(:unread => true)
end

end
