class AddSenderNameToMailboxerNotifications < ActiveRecord::Migration
  def change
    add_column :mailboxer_notifications, :sender_name, :string
  end
end
