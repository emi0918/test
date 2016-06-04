class UsersController < ApplicationController
include ApplicationHelper
 before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

 def index
  @users= User.all
    @notes = current_user.notes

end


  def show
    @note = @user.notes

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
       session[:user_id] = @user.id

    else
      render :new
    end
  end



  def update
    file = params[:user][:profile_pic]
    @user.set_image(file)

    if @user.update(user_params)
      redirect_to @user, notice: 'ユーザー情報が更新されました'
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

end

















