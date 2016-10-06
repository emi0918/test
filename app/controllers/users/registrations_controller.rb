class Users::RegistrationsController < Devise::RegistrationsController
 include ApplicationHelper
 before_action :authenticate_user!, only: [:show, :edit,:new,:create,:update, :destroy]
 before_action :set_user, only: [:show, :edit, :update, :destroy]

def new
 @user = User.new(user_params)
 
end

def edit
  @user.mainpic.cache! unless @user.mainpic.blank?
  @user = User.find(params[:id])
end


def create
 @user = User.new(user_params)
 file = params[:user][:mainpic]

 if @user.save
    UserMailer.registration_confirmation.deliver_now(@user)
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
 if  @user.destroy
UserMailer.delete_notification.deliver_now
else
  render :edit
end
  redirect_to users_url, notice: 'ユーザーが削除されました'
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
    params.require(:user).permit(:name, :mainpic, :profile, :area, :email,:password_confirmation)
  end



end
