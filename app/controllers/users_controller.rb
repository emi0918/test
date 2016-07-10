class UsersController < ApplicationController
 include ApplicationHelper
   before_action :authenticate_user!, only: [:show, :edit,:new,:create,:update, :destroy]
   before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
   @users= User.all
   @user = User.includes(:notes)
  end

  def show
   @notes = @user.notes
   @user = User.find_by(id: params[:id])
  end

  def new
   @user = User.new
  end

  def edit
   @user = User.find(params[:id])
  end

  def create
   @user = User.new(user_params)
    file = params[:user][:profile_pic]
    @user.set_image(file)

    if @user.save
       UserMailer.welcome_email(@user).deliver
        session[:user_id] = @user.id
        redirect_to users_path
      else
       render :new

    end
  end

  def update
    file = params[:user][:profile_pic]
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

private

  # @userが自分かどうか
  def correct_user
    user = User.find(params[:id])
    if !current_user? (user)
      redirect_to root_path
    end
  end

    def user_params
      params.require(:user).permit(:user_name, :profile_pic, :profile, :area, :email)
    end

    def sendmail
      user= User.find(params[:id])
      @mail =NoticeMailer.sendmail_confirm(user).deliver

    end

def set_user
      @user = User.includes(:note).where(user_name: params[:id]).first
    end
end


