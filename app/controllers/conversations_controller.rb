class ConversationsController < ApplicationController


  before_action :authenticate_user!
   layout "providers_layout"
  
  def new
  end

  def index
  end

  def create
    recipients = Provider.where(id: conversation_params[:recipients])
    conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
    flash[:notice] = "メッセージが送信されました!"
    redirect_to mailbox_inbox_path
  end

  def show
    @receipts = conversation.receipts_for(current_provider).order("created_at ASC")
    # mark conversation as read
    conversation.mark_as_read(current_user)

  end

  def reply
    current_provider.reply_to_conversation(conversation, message_params[:body])
    flash[:notice] = "メッセージが送信されました。"
    redirect_to conversation_path(conversation)
  end

  private

  def conversation_params
    params.require(:conversation).permit(:subject, :body,recipients:[])
  end

  def message_params
    params.require(:message).permit(:body, :subject)
  end
 def mailbox
    @mailbox ||= current_provider.mailbox
  end

 def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end
  end


