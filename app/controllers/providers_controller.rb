class ProvidersController < ApplicationController

 before_action :set_provider, only:[:index,:show,:destroy]
 before_action :authenticate_provider!
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]
layout "providers_layout"


def index
 	@providers= Provider.all
  @provisder = Provider.includes(:notes)
end

def show
     @receipts = conversation.receipts_for(current_provider).order("created_at ASC")
    # mark conversation as read
    conversation.mark_as_read(current_provider)
end

def reply
  current_provider.reply_to_conversation(conversation, message_params[:body])
  flash[:notice] = "メッセージが送信されました。"
  redirect_to provider_path(conversation)
end


def create
    recipients = Provider.where(id: conversation_params[:recipients])
    conversation = current_provider.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
    flash[:notice] = "メッセージが送信されました!"
    redirect_to inbox_providers_path
end



def profile
end


def mypage
end

def inbox
   @inbox = mailbox.inbox
    @active = :inbox
end

  private

def set_provider
  current_provider  # (1)
    if params[:provider]
      if provider = Provider.find_by_login(params[:provider])  # (2)
        @provider = provider # (3)
      else
        render :text => 'user not found' and return  # (4)
      end
    else
      @provider = @current_provider # (5)
  end
end


    # Rails4からStrongParamaterと呼ばれる機能が追加されました。
    # セキュリティのため、permitメソッドで許可したパラメータ名しか取得できません。
      def provider_params
      params.require(:provider).permit(:name,:address,:provider_id,:mainpic,:email,:password,:password_confirmation,
      provider_accounts_attributes: [:phonenumber, :staffname],
      store_infos_attributes: [:hours,:holiday,:payment,:about,:postalcode,:prefecture,:city,:address,:building]
      )
    end

    def update_provider_params
      params.require(:provider).permit(:name,:address,:provider_id,:mainpic,:email,
      provider_accounts_attributes: [:phonenumber, :staffname,:id, :_destroy],
      store_infos_attributes: [:hours,:holiday,:payment,:about,:postalcode,:prefecture,:city,:address,:building,:id, :_destroy]
      )
    end



def mailbox
  @mailbox ||= current_provider.mailbox
end


def conversation_params
  params.require(:conversation).permit(:subject, :body,recipients:[])
end


def conversation
  @conversation ||= mailbox.conversations.find(params[:id])
end


def message_params
  params.require(:message).permit(:body, :subject)
end


end
