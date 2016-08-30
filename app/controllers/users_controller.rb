class UsersController < ApplicationController
 include ApplicationHelper
 before_action :authenticate_user!, only: [:show, :edit,:new,:create,:update, :destroy]
 before_action :set_user, only: [:show, :edit, :update, :destroy]

 def index
  @users= User.all
  @user = User.includes(:notes)
  @user = User.includes(:reservation)
end

def reservations
 @notes = Note.includes(:provider).all
    @notes = Note.includes(:user).all
 
    @user = User.includes(:reservation)
      @user = User.includes(:notes)
  @reservations = current_user.reservations.all.page(params[:page]).per(4).order(:id)    
 end





def show
 @notes = @user.notes
 @user = User.find_by(id: params[:id])

end

def new
 @user = User.new
end

def edit
  @user.mainpic.cache! unless @user.mainpic.blank?
  @user = User.find(params[:id])
end


def create
 @user = User.new(user_params)
 file = params[:user][:mainpic]

 if @user.save
   UserMailer.complete_registration(@user).deliver_now
   session[:user_id] = @user.id
   redirect_to users_path
 else
   render :new
 end
end


def update
  @user.mainpic.cache! unless @user.mainpic.blank?
  file = params[:user][:mainpic]
  @user.set_image(file)

  if @user.update(user_params)
    redirect_to users_path, notice: 'ユーザー情報が更新されました'
  else
    render :edit
  end
end

def destroy
  @user.destroy
  redirect_to users_url, notice: 'ユーザーが削除されました'
end

def like_notes
  @notes = @user.like_notes
  @title = "いいね！一覧"
  render :index
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


private

def set_user
    current_user  # (1)
    if params[:user]
      if user = User.find_by_login(params[:user])  # (2)
        @user = user  # (3)
      else
        render :text => 'user not found' and return  # (4)
      end
    else
      @user = @current_user  # (5)
    end
  end

  # @userが自分かどうか
  def correct_user
    user = User.find(params[:id])
    if !current_user? (user)
      redirect_to root_path
    end
  end


  def user_params
    params.require(:user).permit(:name, :mainpic, :profile, :area, :email)
  end


  def sendmail
    user= User.find(params[:id])
    @mail =NoticeMailer.sendmail_confirm(user).deliver
  end

  def set_user
    @user = User.includes(:note).where(name: params[:id]).first
  end

end
