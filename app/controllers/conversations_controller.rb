class ConversationsController < ApplicationController


  def index

  end

  def create

    recipients = Provider.where(id: conversation_params[:recipients])
    conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation or  
    current_provider.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation 



    flash[:notice] = "メッセージが送信されました!"
    redirect_to mailbox_inbox_path
  end

  def show
     @receipts = conversation.receipts_for(current_user).order("created_at ASC") or conversation.receipts_for(current_provider).order("created_at ASC")
    # mark conversation as read
    conversation.mark_as_read(current_user)or conversation.mark_as_read(current_provider)
end

def new
 authenticate_user!
end

def reply
  
  current_user.reply_to_conversation(conversation, message_params[:body])
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
  if current_user.try(:id?)
    @mailbox ||= current_user.mailbox
  else
      @mailbox ||= current_provider.mailbox
  end
end


def conversation
  @conversation ||= mailbox.conversations.find(params[:id])
end

end 